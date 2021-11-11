#---------------------------------------------#
# --- Utility Functions -------------------- #
#---------------------------------------------#

#Usage: ps2tiff <.ps file> <output file> <resolution>
ps2tiff() {
 gs -sDEVICE=tiff64nc -o $2 -r$3 $1
}

#Usage: <merged.pdf> <v1.pdf v2.pdf ...>
cpdf() { 
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$1" "${@:2}"
}

#Usage: targz <directory>
targz(){
	dir=${1%/}
	tar -cvf - $dir | pigz -9 > ${dir}.tar.gz
}

# Usage: mawk_stats <filename> <column number>
# TODO : Median and Quartiles...
# TODO : Hoare's Select Algorithm in mawk for median :)
mawk_stats(){
	file=$1
	col=$2
	mawk -v c=$col '{if(min==""){min=max=$c};
		if($c > max){max=$c}; if($c < min){min=$c}; sum+=$c; n+=1}
		END {printf "Min\tMax\tMean\tN\n%.3f\t%.3f\t%.3f\t%.3f\n",min, max ,sum/n, n}' $file
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

# --- Compression Routines --- #

jpgzip(){
	RATIO=$1; jpegoptim -m${RATIO} *.jpg
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

# Sets up a project directory 
setupproject(){
	url='git@github.com:aabiddanda/project_template.git'
  git clone -q ${url} $1
  rm -rf ./$1/.git/
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
