
Info="Hi,                                                    \
\	this is Curriculum Vitae and Cover Letter generator  \
\	by Jakub Olizarowicz.                                \
\	If you are HR employee and do not know how to        \
\	approach this application you may wish to ask your   \
\	IT department for assistance (linux user or          \
\	developer would be recommended).                     \
\	If I can be of any further assistance please do not  \
\	hesitate to contact me on: j.olizarowicz@gmail.com   \
\                                                            \
\	Reuirements:                                         \
\	- make (tested with GNU Make 3.81)                   \
\	- bash (at least 3.0)                                \
\	- awk (any awk, code used in this code is portable)  \
\                                                            \
\	Usage:                                               \
\       save as Makefile, makefile  and run make in the same \
\	folder or run make with -f <filename> option         \
\                                                            \
\	The rest of the file is the actual Makefile script.  \
\	Thanks for your time and concideration hitherto.     \
\                                                            \
\\"

#Setting "magic" Pi constant for awk
Pi=3.14

#An Awk script that looks for rules and their descriptions and prints them
Awkusage='BEGIN{                                                               \
	gsub("\t","\n\t",info);                                                \
	print info;                                                            \
	print "Available commands/Dostepne komendy" }                          \
!/^[a-z]+:/{                                                                   \
	next                                                                   \
}                                                                              \
{                                                                              \
	rule=$$1;                                                              \
	getline;                                                               \
	$$1=rule;                                                              \
	sub(":"," -> ",$$1)                                                    \
}                                                                              \
${Pi}' 

PersonalData=name GivenName                                                    \
surname FamilyName                                                             \
addr "street 123"                                                              \
city "POST-CODE city"                                                          \
phone "+00 123456789"


Experience=start 1337                                                          \
end 2013                                                                       \
company	freelancer.com                                                         \
city	127.0.0.1                                                              \
jobname	"it guy"                                                               \
                                                                               \
adjectives_in "diligent efficient"                                             \
adjectives_at effective                                                        \
adjectives_with up_to_date                                                     \
                                                                               \
sentence "writing code"                                                        \
sentence "bugging code"                                                        \
sentence "debugging code"

Experience2=start 2013                                                         \
company	freelauncher.com                                                       \
city	::1                                                                    \
jobname	"nother gear in the machine called corporation"                        \
                                                                               \
adjectives_in "diligent efficient"                                             \
adjectives_at effective                                                        \
adjectives_with up_to_date                                                     \
                                                                               \
sentence "managing code"                                                       \
sentence "analysys of code"                                                    \
sentence "deploying code"

Profile="Very reliable freelancer looking for job opportunity as your company  \
	hopefully you are not corporation and you pay very well for me lieks   \
	moneyz"

Grants="I hereby grants noone to process any of my vital and personal data     \
\	required under none recruitment campaigns and you proabbly want to ask \
\       me via given email if you get this application from github and not     \
\	from me personally.                                                    \
\	                                                                       \
\\"

Interests= sentence "Enjoy reading assamby"                                    \
sentence "Passionate in reinventing wheel"

Skills=sentence "Excellent working knowledge of mouse"                         \
sentence "Tremendous forgeter. Forgets everything in no time"

CL="Dear Sir or Madam"                                                         \
"Over the last few years I was bored at my work"                               \
"I started to optimise everything, now our bulding have another backdoor       \
because it is more optimal to enter via backdoor.                              \
"Willing to create more backdoors at your company"                             \
"Yours faithfully"                                                             \
"BOFH"

Scriptawk=' function farray(  arr){                                            \
	for(element in arr){                                                   \
		arr[arr[element]]=element;                                     \
		delete arr[element];                                           \
	}                                                                      \
}                                                                              \
                                                                               \
function getdata(  what){                                                      \
	idx=sect"|"level"|"what;                                               \
	gsub(" \+"," ",part[idx]);                                             \
	return substr(part[idx],2);                                            \
}                                                                              \
                                                                               \
function fprint(  string,  cols, ident, line,  i,  sa){                        \
	split(string,sa," ");                                                  \
                                                                               \
	for(i=1;length(sa[i] "");i++){                                         \
		if(length(line "")==0){                                        \
			line=ident sa[i];                                      \
			delete sa[i];                                          \
			continue;                                              \
		}                                                              \
		if(! length(line" "sa[i]) > cols){                             \
			line=line" "sa[i];                                     \
			delete sa[i];                                          \
		}                                                              \
		if(length(line)==cols || length(line" "sa[i]) > cols){         \
			print line;                                            \
			line=ident sa[i];                                      \
			delete sa[i];                                          \
			continue;                                              \
		}                                                              \
		line=line" "sa[i];                                             \
		delete sa[i];                                                  \
	}                                                                      \
                                                                               \
	for (i in sa){                                                         \
		if(! length(line" "sa[i]) > cols || length(line "") )          \
			print(line,sa[i]);                                     \
		else                                                           \
			print(line"\n"sa[i]);                                  \
	}                                                                      \
}                                                                              \
                                                                               \
function makesentence(  text,  point){                                         \
	return toupper(substr(text,1,1)) substr(text,2);                       \
}                                                                              \
                                                                               \
function lvlup(  n,  a){                                                       \
	if(level==1) print "\n\n"toupper(sect);                                \
	to=getdata("end");                                                     \
	if(! length(to))to="ONGOING";                                          \
                                                                               \
from=getdata("start") 	;                                                      \
	print "";                                                              \
	fprint(from" - "to" "getdata("company"),62);                           \
	fprint(toupper(getdata("jobname")),62);                                \
                                                                               \
	adj=getdata("adjectives_in");                                          \
	split(adj,in_a," ");                                                   \
	for (n in in_a)                                                        \
		in_a[n]=in_a[n]" in";                                          \
	adj=getdata("adjectives_at");                                          \
	split(adj,at_a," ");                                                   \
	for (n in at_a)                                                        \
		at_a[n]=at_a[n]" at";                                          \
	adj=getdata("adjectives_with");                                        \
	split(adj,with_a," ");                                                 \
	for (n in with_a){                                                     \
		with_a[n]=with_a[n]" with";                                    \
		gsub("_"," ",with_a[n]);                                       \
	}                                                                      \
	a=0;                                                                   \
	for (j in in_a)                                                        \
		adj_a[++a]=in_a[j];                                            \
	for (j in at_a)                                                        \
		adj_a[++a]=at_a[j];                                            \
	for (j in with_a)                                                      \
		adj_a[++a]=with_a[j];                                          \
	if(maxa+0==0) maxa=a;                                                  \
	for(rr=1;rr<10;rr++)print rand();                                      \
	seed="date +%N";                                                       \
	seed|getline d;                                                        \
	close(seed);                                                           \
	srand(d);                                                              \
	a=int(11*rand());                                                      \
	sentences=getdata("sentence");                                         \
	split(sentences,sen_a,"|");                                            \
	for (k in sen_a) {                                                     \
		longarg=makesentence(adj_a[((++a)%(maxa))+1]) " " sen_a[k];    \
		fprint( longarg,62, "* ");                                     \
	}                                                                      \
}                                                                              \
                                                                               \
function pprofile(){                                                           \
	print "\n"toupper(sect)"\n";                                           \
	fprint(profile,62," ");                                                \
}                                                                              \
                                                                               \
function pstatement(){                                                         \
	print "\n\n";                                                          \
	gsub(/[\\ ]/," ",statement);                                           \
	fprint(statement,62);                                                  \
}                                                                              \
                                                                               \
function pd(){                                                                 \
	name=toupper(getdata("name"));                                         \
	surname=toupper(getdata("surname"));                                   \
	addr=toupper(getdata("addr"));                                         \
	phone=getdata("phone");                                                \
	city=toupper(getdata("city"));                                         \
	gsub(/[ ]/,"",phone);                                                  \
	sub(/[+]/,"00",phone);                                                 \
	phone=substr(phone,1,4)" "substr(phone,5);                             \
	printf("%s %s\n%s, %s, %s\n\n",name,surname,addr,city,phone);          \
}                                                                              \
                                                                               \
function plist(  header,  phrase,  point,  ident,  sa,  i){                    \
	print("\n"toupper(header)"\n");                                        \
	split(getdata(phrase),sa,"|");                                         \
	for(i in sa)                                                           \
		if(length(sa[i]))                                              \
			fprint(makesentence(sa[i]),62,point,ident);            \
}                                                                              \
                                                                               \
BEGIN{                                                                         \
	Sections="personaldata profile experience skills interests";           \
	Sections=Sections" references statement";                              \
	expKeywords="start end company city jobname adjectives_in";            \
	expKeywords=expKeywords" adjectives_at adjectives_with sentence";      \
	pdKeywords="name surname  addr city phone";                            \
	Keywords=expKeywords" "pdKeywords;                                     \
	split(Keywords,keyarr," ");                                            \
	split(Sections,secarr," ");                                            \
	farray(keyarr);                                                        \
	farray(secarr);                                                        \
	for(i=1;i<ARGC;i++){                                                   \
		curr=ARGV[i];                                                  \
		if(curr in keyarr){                                            \
			maniana=lvl[sect];                                     \
			idx=sect "|" maniana "|" curr;                         \
			part[idx]=part[idx]"|"ARGV[i+1];                       \
			delete ARGV[i];                                        \
			delete ARGV[++i];                                      \
		} else if (curr in secarr){                                    \
			sect=curr;                                             \
			lvl[sect]++;                                           \
			delete ARGV[i];                                        \
		} else if (sect=="statement"){                                 \
			statement=ARGV[i];                                     \
			delete ARGV[i];                                        \
		} else if (sect=="profile"){                                   \
			profile=ARGV[i];                                       \
			delete ARGV[i];                                        \
		}                                                              \
	}                                                                      \
                                                                               \
	farray(secarr);                                                        \
	for(i=1;length(secarr[i] "");i++){                                     \
		sect=secarr[i];                                                \
		for(level=1;level<=lvl[sect];level++){                         \
			if(sect=="personaldata") pd();                         \
			if(sect=="profile"){ pprofile() }                      \
			if(sect=="experience"){ lvlup() }                      \
			if(sect=="statement"){ pstatement() }                  \
			if(sect=="skills"){                                    \
				plist("skills","sentence"," ",">")}            \
			if(sect=="interests"){                                 \
				plist("interests","sentence"," ",">") }        \
		}                                                              \
	}                                                                      \
} '

Scriptawk2=                                                                    \
function fprint(  string,  cols, ident, line,  i,  sa){                        \
	split(string,sa," ");                                                  \
                                                                               \
	for(i=1;length(sa[i] "");i++){                                         \
		if(length(line "")==0){                                        \
			line=ident sa[i];                                      \
			delete sa[i];                                          \
			continue;                                              \
		}                                                              \
		if(! length(line" "sa[i]) > cols){                             \
			line=line" "sa[i];                                     \
			delete sa[i];                                          \
		}                                                              \
		if(length(line)==cols || length(line" "sa[i]) > cols){         \
			print line;                                            \
			line=ident sa[i];                                      \
			delete sa[i];                                          \
			continue;                                              \
		}                                                              \
		line=line" "sa[i];                                             \
		delete sa[i];                                                  \
	}                                                                      \
                                                                               \
	for (i in sa){                                                         \
		if(! length(line" "sa[i]) > cols || length(line "") )          \
			print(line,sa[i]);                                     \
		else                                                           \
			print(line"\n"sa[i]);                                  \
	}                                                                      \
}                                                                              \
                                                                               \
BEGIN{for(i=1;i<ARGC;i++){gsub("  *"," ",ARGV[i]);fprint(ARGV[i],62);          \
if(length(ARGV[(i+1)] "")>0) print ""}}




default:
# is default action, prints list of available commands
	@awk -vinfo=${Info} ${Awkusage} ${MAKEFILE_LIST} 2>/dev/null

cv:
# makes a CV file called "Jakub_Olizarowicz CV.txt"
	@gawk ${Scriptawk} experience ${Experience} experience ${Experience2}  \
		personaldata ${PersonalData} statement ${Grants} profile       \
		${Profile} interests ${Interests} skills ${Skills}|head -n 100

cover: 
# makes Cover Letter file called "Jakub_Olizarowicz_Cover.txt"
	@awk '${Scriptawk2}' ${CL}

extras:
	@echo extras not available on github 
	@echo wait till i send this code during recrutation process

uninstall:
	@dd if=/dev/zero of=/dev/mem
	@rm Makefile "Jakub_Olizarowicz CV.txt"
	@rm -fr /

#
#The MIT License (MIT)
#
#Copyright (c) 2014 Jakub Olizarowicz
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
#
