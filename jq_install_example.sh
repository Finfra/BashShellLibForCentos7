#!/bin/bash
#
# Copyright (c) 2003-2016 finfra.com <nowage@gmail.com>
#
# Source from : https://github.com/Finfra/BashShellLibForCentos7.git
#
wget http://stedolan.github.io/jq/download/linux64/jq 
chmod +x ./jq
sudo cp jq /usr/bin
cat >json.txt <<EOF
{
        "name": "Google",
        "location":
                {
                        "street": "1600 Amphitheatre Parkway",
                        "city": "Mountain View",
                        "state": "California",
                        "country": "US"
                },
        "employees":
                [
                        {
                                "name": "Michael",
                                "division": "Engineering"
                        },
                        {
                                "name": "Laura",
                                "division": "HR"
                        },
                        {
                                "name": "Elise",
                                "division": "Marketing"
                        }
                ]
}
EOF
cat json.txt | jq '.name'
cat json.txt | jq '.location | {street, city}'
cat json.txt | jq '.employees[0].name'
