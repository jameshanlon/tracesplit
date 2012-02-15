#! /usr/bin/env python3

import sys
import re
#import resource

def write(outfiles, core, thread, time, inst):
  def key(core, thread):
    return 'c{}t{}'.format(core, thread)
  k = key(core, thread)  
  if not k in outfiles:
    outfiles[k] = open(k+'.trace', 'w')
  outfiles[k].write('{} {}\n'.format(time, inst))

def main(args):
  if len(args) != 2:
    print('Usage: {} <filename>'.format(args[0]))
    sys.exit(1)
  filename = args[1]
  outfiles = {}
  pattern = re.compile(r' *([0-9]+) \[c([0-9]+)t([0-9]+)\] (.*)')
  #resource.setrlimit(resource.RLIMIT_NOFILE, (500,-1))
  try:
    f = open(filename, 'r')
    line = f.readline()
    while(line != ''):
      matcher = re.match(pattern, line)
      if matcher != None:
        time = int(matcher.group(1))
        core = int(matcher.group(2))
        thread = int(matcher.group(3))
        inst = matcher.group(4)
        write(outfiles, core, thread, time, inst)
        #print('@{} c{}t{}'.format(time, core, thread))
      line = f.readline()
    f.close()
    for k in outfiles.keys():
      outfiles[k].close()
  except:
    raise Exception('Unexpected error: {}'
        .format(sys.exc_info()[0]))

if __name__ == '__main__':
  sys.exit(main(sys.argv))

