from xehelper import netlist_to_json, config_to_python_code, NetlistEncoder
import sys, requests, argparse, json

def main():
      parser = argparse.ArgumentParser(description='Convert a circuit file to JSON to run xeapi')

      parser.add_argument('--nl',
                        default=None,	
                        required=True,
                        help='Netlist file')

      parser.add_argument('--ud',
                        default=None,	
                        required=True,
                        help='User Directive file')

      parser.add_argument('--tf',
                        default=None,	
                        required=True,
                        help='Technology file')

      parser.add_argument('--design',
                        default=None,     
                        required=True,
                        help='Design name')

      parser.add_argument('--url',
                        default=None,     
                        required=True,
                        help='xeapi url')

      parser.add_argument('--token',
                        default=None,     
                        required=True,
                        help='token')

      parser.add_argument('-o', '--output',
                        default=None,	
                        help='Output file')

      parser.add_argument('--ground',
                        type=int,
                        default=0,
                        help='Ground node')

      parser.add_argument('--build',
                        default=False, action='store_true',
                        help='Build circuit')

      args = parser.parse_args()
      headers = {
        'Authorization': 'Token %s' % args.token
      }
      #print (sys.argv[1:]);
      netlist_JSON = netlist_to_json(args.nl)
      ud_dict = config_to_python_code(args.ud)
      tf_dict = config_to_python_code(args.tf)
      final_dict = {"xe3_tf" : tf_dict, "xe3_ud" : ud_dict} 
      final_dict.update(json.loads(netlist_JSON))
      #print(final_dict)
      data = {
            "name": args.design,
            "xe_status": "not running",
            "netlist_json": final_dict,
            "xe_json": {"status" : "not run"},
      }
      dataJSON  = json.dumps(data, indent=None, cls=NetlistEncoder, separators=(',', ':'))
      #print(dataJSON)
      url_netlists = f"{args.url}/netlists/" 
      r = requests.post(url_netlists, headers=headers, json=data)
      if (r.status_code==200 or r.status_code==201):
            response_dict = json.loads(r.text)
            #print(response_dict)
            url_str = response_dict["url"]
            run_xe_url = f"{url_str}run_testcase"
            rxe = requests.get(run_xe_url, headers=headers)
            response_dict = json.loads(rxe.text)
            task_id = response_dict["task_id"]
            ret_response = {"url" : url_str, "task_id" : task_id}
            responseJSON = json.dumps(ret_response)
            print(responseJSON)
            return 0
      ret_response = {"status_code" : r.status_code}
      responseJSON = json.dumps(ret_response)
      print(responseJSON)
      return 1
      
main()