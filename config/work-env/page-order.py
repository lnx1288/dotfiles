#!/usr/bin/env python

# Returns the page order and the number of pages required
# by the kernel to satisfy a 'kmem_alloc' request

# usage:
#   python page-order.py <request_size>
#
# where:
#   - request_size: size of the request in bytes

import sys
from math import log

exp = 12

print('request size: {} bytes'.format(int(sys.argv[1])))

while True:
    if 2**exp >= int(sys.argv[1]):
        size_kb = int(2**exp / 1024)

        order = int(log(int(size_kb/4), 2)) # dividing by 4KB page size

        print('page order required:  {} ({}KB = 2^{}*4KB)'.format(order, size_kb, order))
        break
    else:
        exp+=1
