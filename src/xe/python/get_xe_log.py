from xehelper import netlist_to_json, config_to_python_code, NetlistEncoder
import sys, requests, argparse, json

def get_xe_log(url, headers):
      r = requests.get(url, headers=headers)

      print(r.content)

def main():
      parser = argparse.ArgumentParser(description='Check status of XE')

      parser.add_argument('name',
            default=None,     
            help='name of design')

      parser.add_argument('--url',
                        default=None,     
                        required=True,
                        help='xeapi URL')

      parser.add_argument('--token',
                        default=None,     
                        required=True,
                        help='token')

      args = parser.parse_args() 
      headers = {
            'Authorization': 'Token %s' % args.token
      }
      url1 = f"{args.url}/get_log/{args.name}"
      r = requests.get(url1, headers=headers)
      # print(r.content)
      encoding = 'utf-8'
      print(r.content.decode(encoding))
      
main()