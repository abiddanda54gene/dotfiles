#---------------------------------------------#
# --- Utility Functions -------------------- #
#---------------------------------------------#

#Usage: targz <directory>
targz(){
	dir=${1%/}
	tar -cvf - $dir | gzip -9 > ${dir}.tar.gz
}

# linecnt group of files in order (ie. by chromosome)
lncntorder(){ ext=$1; for c in $(ls -v *.${ext}); do wc -l $c; done;}

# print a given field
p(){ 
  awk -v F=$1 '{print $F}'
}

# Usage: up N
up(){ DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; }

# Usage : println <n> <FILENAME>
println(){
  n=$1
  FILENAME=$2
  sed -n "${n}p"  ${FILENAME}
}


# --- Compressed Files --- #
zip2stream(){
	ext1=${1#*.}
	ext2=${1##*.}
	if [ "$ext1" == "gz" -o "$ext2" == "gz" ]; then
		if [ "$ext1" == "tar.gz" ];then
			tar -xzOf $1
		else
			gzip -cd $1
		fi
	elif [ "$ext1" == "zip" ]; then
			unzip -caq $1
	else
		echo "Not Applicable! (not a compressed file)"
	fi
}

zlncntfn(){
	zip2stream $1 | wc -l
}

zpeekfn(){
	zip2stream $1 | head -n $2
}

# --- Code Setup --- #

# Sets up a canonical python script from a template
setuppy(){
	cp ~/.pytemplate $1
}

# Sets up a generic latex article template + makefile
setuptex(){
	cp ~/.textemplate $1
}

# Print Kth column of a stream
p(){
	awk -v '{print i}'
}

# calculate the correlation from a two column stream 
corr(){
	awk -v F1=$1 -v F2=$2 '{n +=1; 
		x+=$F1; 
		y+=$F2; 
		f=1/n; 
		dx=$F1-mx; 
		dy=$F2-my; 
		mx+=f*dx; 
		my+=f*dy; 
		vx=(1-f)*(vx - f*dx*dx); 
		vy=(1-f)*(vy - f*dy*dy); 
		cxy=(1-f)*(cxy - f*dx*dy);} END {print cxy/sqrt(vx * vy)}'
}
