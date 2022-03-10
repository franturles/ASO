#!/bin/bash
getent passwd {1000..60000} | cut -d: -f1 | grep -E '(^c|^P)'
