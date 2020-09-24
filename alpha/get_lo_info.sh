#!/bin/bash


# This code identifies who the user is, what machine they are working on,
# and saves important paths to a csv file.  It is meant to be called by
# any of the LiveOcean code (python, matlab, or shellscripts).

# In order to facilitate having other users be able to use the LiveOcean
# code, the calling code will always look for LiveOcean_user/get_lo_info.sh first
# and only execute this one if the _user version does not exist.

# LiveOcean_user/get_lo_info.sh will not be part of the repo code base.  Instead a user
# should copy this code to that name and make any edits there by hand.
# Then their get_lo_info.sh will not be overwritten when using git pull

# This script is intended to be called by Lfun.Lstart() as
# well as the driver shellscripts.  The goal is to centralize the specification
# of LiveOcean directory locations and other info that had crept into those four
# places.

# defaults
roms2="BLANK"

if [ $HOME == "/Users/erikfred" ] ; then
  lo_env='pm_mac'
  parent=$HOME"/Documents/ROMS/"
  LO=$parent"LiveOcean/"
  data=$parent"LiveOcean_data/"
  LOo=$parent"LiveOcean_output/"
  roms=$parent"LiveOcean_roms/"
  which_matlab="/Applications/MATLAB_R2020a.app/bin/matlab"

elif [ $HOME == "/home/parker" ] && [[ $HOSTNAME == *"fjord"* ]] ; then
  lo_env='pm_fjord'
  parent="/data1/parker/"
  LO=$parent"LiveOcean/"
  data=$parent"LiveOcean_data/"
  LOo=$parent"LiveOcean_output/"
  roms="/pmr1/parker/LiveOcean_roms/"
  which_matlab="/usr/local/bin/matlab"

# If none of the above apply ASSUME that we are on fjord.
else
  lo_env='pm_fjord'
  parent="/data1/parker/"
  LO=$parent"LiveOcean/"
  data=$parent"LiveOcean_data/"
  LOo=$parent"LiveOcean_output/"
  roms="/pmr1/parker/LiveOcean_roms/"
  which_matlab="/usr/local/bin/matlab"

fi

# write info to a temporary file for use by other programs
outfile=$LO"alpha/lo_info.csv"
echo "lo_env",$lo_env > $outfile
echo "parent",$parent >> $outfile
echo "LO",$LO >> $outfile
echo "data",$data >> $outfile
echo "LOo",$LOo >> $outfile
echo "roms",$roms >> $outfile
echo "roms2",$roms2 >> $outfile
echo "which_matlab",$which_matlab >> $outfile
