# procuser
Download and convert user.csv from radioid.net to load into my rt3s

user.csv is the full contacts list for all allocated Amateur Radio DMR ids.  This little perl script will download the full list of DMR ids from https://www.radioid.net/database/dumps#! and process it to only include certain countries.

By default these countries are;
- Australia
- New Zealand
- United Kingdom
- United States

To change that you can edit the script.

The output is also slightly re-arranged to suit the CSV import of the RT3S Code plug Editor.

## Usage

./procuser.pl > dmrusers-20210626.csv

## Options
**None**

## Dependancies
lwp-simple

    sudo apt install libwww-perl

or whatever works on your distribution/os.
