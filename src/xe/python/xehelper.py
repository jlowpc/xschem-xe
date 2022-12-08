import json, re, os
from json import JSONEncoder
from PySpice.Spice.Parser import SpiceParser
from configparser import ConfigParser
from collections import OrderedDict

class Netlist:
    def __init__(self, modules):
        self.modules = modules
    def write_spice(self, fn):
        if fn is None:
            fp = sys.stdout
        else:
            fp = open(fn, 'w')
        print("* %s" %(fn), file=fp)
        print("*", file=fp)
        for key in self.modules:
            module = self.modules[key]
            module.write_spice(fp)
        if fn is not None:
            fp.close()

class Module:
    def __init__(self, name, ports, parameters, cells):
        self.name = name
        self.ports = ports
        self.parameters = parameters
        self.cells = cells

    def write_spice(self, fp):
        print(".subckt %s" %(self.name), end=" ", file=fp)
        for port in self.ports:
            print("%s" %(port), end=" ", file=fp)
        for key in self.parameters:
            print("%s=%s" %(key, self.parameters[key]), end=" ", file=fp)
        print("", file=fp)
        for key in self.cells:
            self.cells[key].write_spice(fp)
        print(".ends\n")

class Cell:
    def __init__(self, name, ports, parameters, model):
        self.name = name
        self.ports = ports
        self.parameters = parameters
        self.model = model

    def write_spice(self, fp):
        print("%s" %(self.name), end=" ", file=fp)
        for port in self.ports:
            print("%s" %(port), end=" ", file=fp)
        print(self.model, end = " ", file=fp)    
        for key in self.parameters:
            print("%s=%s" %(key, self.parameters[key]), end=" ", file=fp)
        print("", file=fp)

# subclass JSONEncoder
class NetlistEncoder(JSONEncoder):
        def default(self, o):
            return o.__dict__

def json_string_to_netlist_obj(jdict):
    if 'modules' not in jdict:
        return jdict
    modules = {}
    for name in jdict['modules'].keys():
        module_dict = jdict['modules'][name]
        cells = {}
        for x in module_dict['cells']:
            cell_dict = module_dict['cells'][x]
            cell = Cell(x, cell_dict['ports'], cell_dict['parameters'], cell_dict['model'])
            cells[x] = cell
        module = Module(name, module_dict['ports'], module_dict['parameters'], {cells})
        modules[name] = module
    return Netlist(modules)
    return jdcit

def create_cell(name, tokens):
    ports = []
    parameters = dict()
    model = ""
    for token in tokens:
        has_equal = re.match(r'(.*)=(.*)', token, re.M)
        if has_equal:
            lhs = has_equal.group(1)
            rhs = has_equal.group(2)
            if (lhs=='model'):
                model = rhs
            else:
                parameters[lhs] = rhs
        else:
            ports.append(token)
    if model=="":
        model = ports.pop()
    cell = Cell(name, ports, parameters, model)
    return cell
    
def netlist_to_json(fn):
    parser = SpiceParser(path=fn)
    parser.build_circuit()
    circuit = parser.to_python_code()
    subckt_dict = dict()
    subckt = ""
    for line in circuit.split('\n'):
        #print(line)
        matchSubckt = re.match(r'subcircuit_(.*) = SubCircuit\((.*)\)', line, re.M)
        if matchSubckt:
            subckt = matchSubckt.group(1)
            #print(f'match subckt {subckt:s}')
            ports = matchSubckt.group(2).replace('\'', '')
            port_array = ports.split(', ')
            port_array.pop(0)
            subckt_dict[subckt] = Module(subckt, port_array, {}, {})
        else:
            matchM = re.match(f'subcircuit_{subckt:s}.(m|M)\((.*)\)', line, re.M)
            if matchM:
                mChar = matchM.group(1)
                str2 = matchM.group(2).replace('\'', '')
                mtokens = str2.split(', ')
                name = mtokens.pop(0)
                cell_name = f'{mChar:s}{name:s}'
                #print(f'match M {cell_name:s}')
                cell = create_cell(cell_name, mtokens)
                subckt_dict[subckt].cells[cell_name] = cell
            else:
                matchX = re.match(f'subcircuit_{subckt:s}.(x|X)\((.*)\)', line, re.M)
                if matchX:
                    xChar = matchX.group(1)
                    str2 = matchX.group(2).replace('\'', '')
                    xtokens = str2.split(', ')
                    name = xtokens.pop(0)
                    if xChar == 'X':
                        def_name = xtokens.pop(0)
                        xtokens.append(def_name)
                    cell_name = f'{xChar:s}{name:s}'
                    #print(f'match X {cell_name:s}')
                    cell = create_cell(cell_name, xtokens)
                    subckt_dict[subckt].cells[cell_name] = cell
                    netlist = Netlist(subckt_dict)
    moduleJSONData = json.dumps(netlist, indent=None, cls=NetlistEncoder, separators=(',', ':'))
    #print("this is moduleJSONData")
    #print(moduleJSONData)
    return moduleJSONData
                    

def write_config(fn, filetype, config_dict):
    if fn is None:
        fp = sys.stdout
    else:
        fp = open(fn, 'w')
    if filetype in config_dict:
        for sections in config_dict[filetype]:
            for name in sections.keys():
                print("[%s]" %(name), file=fp)
                for item in sections.values():
                    for tt in item:
                        print("%s=%s" %(tt[0], tt[1]), file=fp)
                print(file=fp)
                    
    if fn is not None:
        fp.close()

def write_spice(fn, config_dict):
    if "modules" in config_dict:
        json_str = json.dumps(config_dict)
        print(json_str)
        netlist = json.loads(json_str, object_hook=json_string_to_netlist_obj)
        netlist.write_spice(fn)

# filetype = xe3_tf, xe3_ud, xe4_tf, xe4_ud
def write_config(fn, filetype, json_str):
    if fn is None:
        fp = sys.stdout
    else:
        fp = open(fn, 'w')
    config_dict = json.loads(json_str)
    if filetype in config_dict:
        for config_dict2 in config_dict[filetype]:
            for name in config_dict2.keys():
                print("[%s]" %(name), file=fp)
                for key in config_dict2[name].keys():
                    print("%s=%s" %(key, config_dict2[name][key]), file=fp)
            print(file=fp)
    if fn is not None:
        fclose(fp)

# Source: https://stackoverflow.com/questions/9876059/parsing-configure-file-with-same-section-name-in-python
class multidict(OrderedDict):
    _unique = 0   # class variable

    def __setitem__(self, key, val):
        if isinstance(val, list) and key in self:
            self._unique += 1
            key += f":{str(self._unique)}"
        elif isinstance(val, dict):
            #print(f"dict {key} {val}")
            self._unique += 1
            key += f":{str(self._unique)}"
        OrderedDict.__setitem__(self, key, val)

def config_to_python_code(fn):
    #config = ConfigParserMultiOpt()
    config = ConfigParser(defaults=None, dict_type=multidict, strict=False)
    config.read_file(open(fn))
    #my_config_parser_dict = {s:dict(config.items(s)) for s in config.sections()}
    config_list = []
    for s in config.sections():
        #print(s)
        ss = re.sub(":\d$", "", s, count=0, flags=0)
        if ss=='include':
            for f in config.items(s):
                if f[0] == 'file':
                    fn1 = get_absolute_path(fn, f[1])
                    ii2 = config_to_python_code(fn1)
                    for ii in ii2:
                        config_list.append(ii)
            continue
        items = dict()
        updated_tuples = list()
        for item2 in config.items(s):
            updated_tuples.append((re.sub(":\d$", "", item2[0], count=0, flags=0), item2[1]))
        #print(updated_tuples)
        items[ss] = updated_tuples
        config_list.append(items)
    return config_list

def get_absolute_path(fn1, fn2):
    file_name = os.path.basename(fn1)  
    location = os.path.dirname(fn1)    
    return f"{location}{os.path.sep}{fn2}"

def Test():
    json_str='{"modules":{"inv":{"name":"inv","ports":["in","out","vdd","vss"],"parameters":{},"cells":{"mp1":{"name":"mp1","ports":["out","in","vdd","vss"],"parameters":{"W":"1.23","l":"1.24","as":"1.25","ad":"1.25","ps":"1.25","pd":"1.25"},"model":"sky130_fd_pr__pfet_01v8"},"mn1":{"name":"mn1","ports":["out","in","vdd","vss"],"parameters":{"W":"2.23","l":"2.24","as":"2.25","ad":"2.25","ps":"2.25","pd":"2.25"},"model":"sky130_fd_pr__nfet_01v8"}}},"buffer":{"name":"buffer","ports":["in","out","vdd","vss"],"parameters":{},"cells":{"x1":{"name":"x1","ports":["out","in","vdd","vss"],"parameters":{},"model":"inv"}}}}}'
    mp1 = Cell("mp1", [ "out", "in", "vdd", "vss" ], {
                "W": "1.23",
                "l": "1.24",
                "as": "1.25",
                "ad": "1.25",
                "ps": "1.25",
                "pd": "1.25"
              }, "sky130_fd_pr__pfet_01v8")

    mn1 = Cell("mn1", [ "out", "in", "vdd", "vss" ], {
                "W": "2.23",
                "l": "2.24",
                "as": "2.25",
                "ad": "2.25",
                "ps": "2.25",
                "pd": "2.25"
              }, "sky130_fd_pr__nfet_01v8")

    x1 = Cell("x1", [ "out", "in", "vdd", "vss" ], {}, "inv")

    inv = Module("inv", [ "in", "out", "vdd", "vss" ], {}, {'mp1' : mp1, 'mn1' : mn1})
    buffer_module = Module("buffer", [ "in", "out", "vdd", "vss" ], {}, {'x1' : x1})

    netlist = Netlist({"inv" : inv, "buffer" : buffer_module})

    #netlist.write_spice("inv.spice")

    #print("Printing to check how it will look like")
    #print(NetlistEncoder().encode(netlist))

    print("Encode Module Object into JSON formatted Data using custom JSONEncoder")
    moduleJSONData = json.dumps(netlist, indent=None, cls=NetlistEncoder, separators=(',', ':'))
    print(moduleJSONData)

    # JSON string to python dict
    print("JSON String to python dict")
    netlist2 = json.loads(json_str, object_hook=json_string_to_netlist_obj)
    print(netlist2)
    #netlist2.write_spice("test.spice")

    # Let's load it using the load method to check if we can decode it or not.
    #print("Decode JSON formatted Data")
    #moduleJSON = json.loads(moduleJSONData)
    #print(moduleJSON)
