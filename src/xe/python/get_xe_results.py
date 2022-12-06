from xehelper import netlist_to_json, config_to_python_code, NetlistEncoder
import sys, requests, argparse, json
import tenacity

def check_status(url, headers):
      r = requests.post(url, headers=headers)
      #print(r.content)
      response_dict = json.loads(r.text)
      state = response_dict['state']
      if state != "SUCCESS":
            raise Exception("Couldn't find SUCCESS")

@tenacity.retry(wait=tenacity.wait_fixed(5))
def connect(url, headers):
    try:
        check_status(url, headers)
    except Exception:
        # print("Pending finalized status, will retry again")
        # raise
        wait(3)
        pass

def main():
      parser = argparse.ArgumentParser(description='Check status of XE')

      parser.add_argument('task_id',
            default=None,     
            help='Task ID')

      parser.add_argument('--wd',
                  default=None,     
                  required=True,
                  help='Working directory')

      parser.add_argument('--url',
                        default=None,     
                        required=True,
                        help='xeapi URL')

      parser.add_argument('--results_url',
                        default=None,     
                        required=True,
                        help='URL to get results')

      parser.add_argument('--token',
                        default=None,     
                        required=True,
                        help='token')

      parser.add_argument('--time',
                  default=None,     
                  help='Wait Time')

      args = parser.parse_args() 
      headers = {
            'Authorization': 'Token %s' % args.token
      }
      url1 = f"{args.url}/status/{args.task_id}" 
      connect(url1, headers)
      r = requests.get(f"{args.results_url}", headers=headers)
      response_dict = json.loads(r.text)
      # print(r.text)

      for report in response_dict['xe_json']:
            if report == 'fi_subckt':
                 f = open(f"{args.wd}/{report}.xe_fi_subckt", "w") 

                 for item in response_dict['xe_json'][report]:
                        f.write(f"{item['subckt']}:\n")
                        for value in item['fi_device']:
                              for inst in value:
                                    f.write(f"  - {inst}")
                        f.write("\n")
            else:
                  f = open(f"{args.wd}/{report}.csv", "w")
                  is_first = True
                  for item in response_dict['xe_json'][report]:
                        is_first2 = True
                        if is_first:
                              for key in item:
                                    if not is_first2: f.write(",")
                                    f.write(key)
                                    is_first2=False
                              f.write("\n")
                              is_first = False
                        is_first2 = True
                        for value in item.values():
                              if not is_first2: f.write(",")
                              f.write(value)
                              is_first2=False
                        f.write("\n")
            f.close()

      #with open(filename) as openfile:
      #json.dump(list(log_disk.values()), file)
      return 0      

main()