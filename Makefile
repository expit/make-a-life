
Info='Hi,                                                        \
\	this is Curriculum Vitae and Cover Letter generator      \
\	by Jakub Olizarowicz.                                    \
\	If you are HR employee and do not know how to approach   \
\	this application you may wish to ask your IT department  \
\	for assistance (linux user or developer would be         \
\	recommended).                                            \
\	If I can be of any further assistance please do not      \
\	hesitate to contact me on: j.olizarowicz@gmail.com       \
\\                                                               \
\	Reuirements:                                             \
\	- make (tested with GNU Make 3.81)                       \
\	- bash (at least 3.0)                                    \
\	- awk (any awk, code used in this code is portable)      \
\\                                                               \
\	Usage:                                                   \
\	save as Makefile, makefile  and run make in the same     \
\	folder or run make with -f <filename> option             \
\\                                                               \
\	The rest of the file is the actual Makefile script.      \
\	Thanks for your time and concideration hitherto.         \
\                                                                \
\\'

#Setting "magic" Pi constant for awk
Pi=3.14

#An Awk script that looks for rules and their descriptions and prints them
Awkusage='BEGIN{                                                               \
	gsub("\t","\n\t",info);                                                \
	gsub("\\\\","\n",info);                                                \
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

PersonalData=name Jakub                                                        \
surname Olizarowicz                                                            \
addr "61-285 Poznan"                                                           \
city "62-200 Gniezno"                                                          \
phone "+48 698083558"


ArtSoft=start "AUGUST 2011"                                                    \
end "JUNE 2012"                                                                \
company	"Art-soft Project S.A."                                                \
city	Poznan, Poland                                                         \
jobname	"IT PERSON (AS CONTRACTOR FOR BZWBK S.A.)"                             \
                                                                               \
adjectives_in "accurate profficient competent"                                 \
adjectives_at efficient                                                        \
adjectives_with up_to_date                                                     \
                                                                               \
sentence "maintaining and supporting Microsoft based internal systems including\
and SQL Server"                                                                \
sentence "liaising with the software developers to ensure problems are reported\
and progressed to completion"

BZWBK=start "JULY 2012"                                                        \
company	"BANK ZACHODNI WBK S.A."                                               \
city	"Poznan, Poland"                                                       \
jobname	"senior it person"                                                     \
                                                                               \
adjectives_in "effective diligent proficient competent experienced succinct    \
thorough Successful Precise"                                                   \
adjectives_at efficient                                                        \
adjectives_with up_to_date                                                     \
                                                                               \
sentence "24/7 system maintenance, working \"out of hours\" to process         \
infrastructure and code changes"                                               \
sentence "ensuring that platforms are kept up to date, consistent and stable   \
and the integrity of the code is maintained throughout the lifecycle"          \
sentence "providing technical support in test environment by implementing new  \
functionalities"                                                               \
sentence "completing code rollout onto production environments for development \
services"                                                                      \
sentence "providing recommendations when handling security issues"             \
sentence "systems recovery by scheduling and performing backups"               \
sentence "handling failover of a Database"                                     \
sentence "monitoring the effectiveness and efficiency of applied solution"     \
sentence "optimization of already existing solutions"                          \
sentence  "maintaining and implementing controls relating to information       \
security and credit/debit card data in line with Group Policy, IT Governance   \
and PCI-DSS regulations"                                                       \
sentence "current and emerging technological advancements"

Profile="An ambitious and motivated system administrator. Able to analyse,     \
diagnose, design, plan, execute and evaluate work. Eagerly accepting new       \
challenges, experienced in working within a dynamic, fast paced environment.   \
Solution – oriented, experienced in building relationship with clients and     \
other team members, committed to providing guidance and support. Effective     \
when working with minimal supervision on technical issues and diligent in      \
problem solving. Would like to combine academic achievements and work          \
experience in a challenging role."

Interests= sentence "Enjoy swimming and water canoeing"                        \
sentence "Passionate in reproduction of medieval weapon and taking part in     \
medieval knights tournaments"

Skills=sentence "Excellent working knowledge of AiX, Linux, Windows, MySQL,    \
Informix Dynamic Server, Oracle RDBMS, Microsoft SQL Server, Nginx, Apache,    \
IIS, ksh93, ksh88, POSIX sh, awk"                                              \
sentence "Team player, well presented and projects a professional manner when  \
communicating with colleagues"                                                 \
sentence "Conscientious, able to use initiative and to focus"                  \
sentence "Results orientated for quality time and cost"                        \
sentence "Good communicator, including written and verbal communication, and a \
good listener, with the ability to show empathy take control and extract all   \
necessary information"                                                         \
sentence "Poses excellent trouble-shooting skills"                             \
sentence "Holder of full, clean EU driving licence cat A and B (7 years)"      


CL="Dear Sir or Madam"                                                         \
"Over the last few years I was succesfully administrating many production      \
servers."                                                                      \
"During my carieer I was sovling loads of puzzles like *James Pond* in his     \
underwater world."                                                             \
"Getting rid of _bugs_ and other insects like *superfrog* was my daily routine \
when others still tried to cross the street finding themself run over by the   \
trucks."                                                                       \
"In my life I have created my own bestiary which allows me to master many      \
_daemon_ on every UNIX system known to a human race. I am profficient in       \
_killing_  _zombies_ aswell."                                                  \
"Yours faithfully"                                                             \
"Jakub Olizarowicz"

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
	originalline=line;                                                     \
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
		if(! length(line" "sa[i]) > cols || length(line "") ){         \
			line=line" "sa[i];                                     \
			print(line);                                           \
		}                                                              \
		else                                                           \
			print(line"\n"sa[i]);                                  \
	}                                                                      \
}                                                                              \
                                                                               \
function makesentence(  text,  point){                                         \
	return toupper(substr(text,1,1)) substr(text,2);                       \
}                                                                              \
function cprint(  text,  cols, tmp, tmp2){ \
	tmp=int((cols-length(text ""))/2); \
	while (tmp--)printf("%s"," "); \
	print text;\
} \
                                                                               \
function lvlup(  n,  a){                                                       \
	if(level==1) print "\n\n"toupper(sect);                                \
	to=getdata("end");                                                     \
	if(! length(to))to="ONGOING";                                          \
                                                                               \
from=getdata("start") 	;                                                      \
	print "";                                                              \
	cprint(from" - "to"    "getdata("company"),$L);                        \
	cprint(toupper(getdata("jobname")),$L);                                \
	print "";                                                              \
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
	seed="date +%N";                                                       \
	seed|getline d;                                                        \
	close(seed);                                                           \
	srand(d);                                                              \
	a=int(11*rand());                                                      \
	sentences=getdata("sentence");                                         \
	split(sentences,sen_a,"|");                                            \
	for (k in sen_a) {                                                     \
		longarg=makesentence(adj_a[((++a)%(maxa))+1]) " " sen_a[k];    \
		fprint( longarg,$L,"  ","*");                                  \
	}                                                                      \
}                                                                              \
                                                                               \
function pprofile(){                                                           \
	print "\n"toupper(sect)"\n";                                           \
	fprint(profile,$L,""," ");                                                \
}                                                                              \
                                                                               \
function pstatement(){                                                         \
	print "\n\n";                                                          \
	gsub(/[\\ ]/," ",statement);                                           \
	fprint(statement,$L);                                                  \
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
			fprint(makesentence(sa[i]),$L,point,ident);            \
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
BEGIN{for(i=1;i<ARGC;i++){gsub("  *"," ",ARGV[i]);fprint(ARGV[i],$L);          \
if(length(ARGV[(i+1)] "")>0) print ""}}


o=(
c=)

Twokfoureight=                                                                 \
trap exit\ 0 INT                                                            EOL\
dump_array$o$c {                                                            EOL\
        printf "%s %s %s %s\\n" "$${array[@]}"                              EOL\
}                                                                           EOL\
                                                                            EOL\
array=$o                                                                    EOL\
0   0   0   0                                                               EOL\
0   0   0   0                                                               EOL\
0   0   0   0                                                               EOL\
0   0   0   0 $c ;                                                          EOL\
                                                                            EOL\
print_grid $o$c {                                                           EOL\
	_row=$$row                                                          EOL\
	_col=$$column                                                       EOL\
	row=0                                                               EOL\
	column=0                                                            EOL\
	while [[ $$row -le 3 ]] ; do                                        EOL\
		printf "+======+======+======+======+\\n"                   EOL\
		printf "|      |      |      |      |\\n"                   EOL\
		while [[ $$column -le 3 ]]; do                              EOL\
			_current="$${array[$$$o$o $$column + 4 *$$row$c$c]}"EOL\
			[[ $$_current -eq 0 ]] && _current=""               EOL\
			printf "| %4s " "$$_current"                        EOL\
			unset _current                                      EOL\
			$o$ocolumn++$c$c                                    EOL\
		done                                                        EOL\
		printf "|\\n"                                               EOL\
		printf "|      |      |      |      |\\n"                   EOL\
		$o$orow++$c$c                                               EOL\
		column=0                                                    EOL\
	done                                                                EOL\
	printf "+======+======+======+======+\\n"                           EOL\
	row=$$_row                                                          EOL\
	column=$$_col                                                       EOL\
}                                                                           EOL\
                                                                            EOL\
get_input $o$c {                                                            EOL\
        stty -icanon                                                        EOL\
	printf  "press up key ... "                                         EOL\
	up="$$$odd count=1 2>/dev/null$c"                                   EOL\
	printf  "\\npress down key ... "                                    EOL\
	down="$$$odd count=1 2>/dev/null$c"                                 EOL\
	printf  "\\npress left key ... "                                    EOL\
	left="$$$odd count=1 2>/dev/null$c"                                 EOL\
	printf  "\\npress right key ... "                                   EOL\
	right="$$$odd count=1 2>/dev/null$c"                                EOL\
	echo                                                                EOL\
	stty icanon                                                         EOL\
}                                                                           EOL\
                                                                            EOL\
test_input $o$c {                                                           EOL\
	stty -icanon                                                        EOL\
	while true; do                                                      EOL\
		printf "press up/down/left/right key\\n"                    EOL\
		input="$$$odd count=1  2>/dev/null$c"                       EOL\
		case "$$input" in                                           EOL\
			$$up$c printf "you pressed up key\\n";;             EOL\
			$$down$c printf "you pressed down key\\n" ;;        EOL\
			$$left$c printf "you pressed left key\\n" ;;        EOL\
			$$right$c printf "you pressed right key\\n" ;;      EOL\
			*$c printf "that is not your directional key\\n"    EOL\
		esac                                                        EOL\
		break                                                       EOL\
	done                                                                EOL\
	stty icanon                                                         EOL\
}                                                                           EOL\
                                                                            EOL\
move_left $o$c {                                                            EOL\
	row=0                                                               EOL\
	while [[ $$row -le 3 ]]; do                                         EOL\
		unset tmp_array tmp_arr_position                            EOL\
		column=0                                                    EOL\
                                                                            EOL\
		while [[ $$column -le 3 ]]; do                              EOL\
			populate_tmp_array                                  EOL\
			$o$ocolumn++$c$c                                    EOL\
		done                                                        EOL\
                                                                            EOL\
		shrink_tmp_arr                                              EOL\
                                                                            EOL\
		update_main_array                                           EOL\
                                                                            EOL\
		$o$orow++$c$c                                               EOL\
	done                                                                EOL\
}                                                                           EOL\
                                                                            EOL\
populate_tmp_array $o$c {                                                   EOL\
	tmp_arr_position=$o"$${tmp_arr_position[@]}" "$$$o$ocolumn + 4 *       \
	$$row $c$c"$c                                                       EOL\
	[[ $${array[$$$o$ocolumn + 4 * $$row $c$c]} -gt 0 ]] &&             EOL\
		tmp_array=$o"$${tmp_array[@]}"                             \EOL\
		"$${array[$$$o$ocolumn + 4 * $$row $c$c]}"$c                EOL\
}                                                                           EOL\
                                                                            EOL\
shrink_tmp_arr $o$c{                                                        EOL\
	i=0                                                                 EOL\
	max="$${\#tmp_array[@]}"                                            EOL\
                                                                            EOL\
	while [[ $$i -le $$max ]]; do                                       EOL\
		if [[ "$${tmp_array[$$i]}" -eq                                 \
		"$${tmp_array[$$$o$o$$i+1$c$c]}" ]] ;                       EOL\
		then                                                        EOL\
			tmp_array[$$i]=$$$o$o 2 * tmp_array[$$i] $c$c       EOL\
			unset tmp_array[$$$o$o$$i+1$c$c]                    EOL\
			$o$o i++ $c$c                                       EOL\
		fi                                                          EOL\
		$o$o i++ $c$c                                               EOL\
	done                                                                EOL\
	tmp_array=$o"$${tmp_array[@]}"$c                                    EOL\
}                                                                           EOL\
                                                                            EOL\
update_main_array $o$c {                                                    EOL\
	i=0                                                                 EOL\
	max="$${\#tmp_array[@]}"                                            EOL\
                                                                            EOL\
	while [[ $$i -le 3 ]]; do                                           EOL\
		array[$${tmp_arr_position[$$i]}]="$${tmp_array[$$i]:-0}"    EOL\
		$o$oi++$c$c                                                 EOL\
	done                                                                EOL\
}                                                                           EOL\
                                                                            EOL\
move_up $o$c {                                                              EOL\
                                                                            EOL\
	column=0                                                            EOL\
	while [[ $$column -le 3 ]]; do                                      EOL\
		unset tmp_array tmp_arr_position                            EOL\
		row=0                                                       EOL\
                                                                            EOL\
		while [[ $$row -le 3 ]]; do                                 EOL\
			populate_tmp_array                                  EOL\
			$o$orow++$c$c                                       EOL\
		done                                                        EOL\
                                                                            EOL\
		shrink_tmp_arr                                              EOL\
                                                                            EOL\
		update_main_array                                           EOL\
                                                                            EOL\
		$o$ocolumn++$c$c                                            EOL\
	done                                                                EOL\
}                                                                           EOL\
                                                                            EOL\
move_down $o$c {                                                            EOL\
                                                                            EOL\
	column=0                                                            EOL\
                                                                            EOL\
	while [[ $$column -le 3 ]]; do                                      EOL\
		unset tmp_array tmp_arr_position                            EOL\
		row=3                                                       EOL\
                                                                            EOL\
		while [[ $$row -ge 0 ]]; do                                 EOL\
			populate_tmp_array                                  EOL\
			$o$orow--$c$c                                       EOL\
		done                                                        EOL\
                                                                            EOL\
		shrink_tmp_arr                                              EOL\
                                                                            EOL\
		update_main_array                                           EOL\
                                                                            EOL\
		$o$ocolumn++$c$c                                            EOL\
	done                                                                EOL\
}                                                                           EOL\
                                                                            EOL\
move_right $o$c {                                                           EOL\
	row=0                                                               EOL\
                                                                            EOL\
	while [[ $$row -le 3 ]]; do                                         EOL\
		unset tmp_array tmp_arr_position                            EOL\
		column=3                                                    EOL\
                                                                            EOL\
		while [[ $$column -ge 0 ]]; do                              EOL\
			populate_tmp_array                                  EOL\
			$o$ocolumn--$c$c                                    EOL\
		done                                                        EOL\
		shrink_tmp_arr                                              EOL\
		update_main_array                                           EOL\
		$o$orow++$c$c                                               EOL\
	done                                                                EOL\
}                                                                           EOL\
random_ $o$c {                                                              EOL\
	stty -icanon                                                        EOL\
	rand_ff="$$$odd count=1 </dev/random 2>/dev/null$c"                 EOL\
	stty icanon                                                         EOL\
	return echo "$$rand_ff"                                             EOL\
}                                                                           EOL\
                                                                            EOL\
add_number $o$c {                                                           EOL\
	unset  zero_position i                                              EOL\
	i=0                                                                 EOL\
	while [[ $$i -lt $${\#array[@]} ]]; do                              EOL\
	[[ array[$$i] -eq 0 ]] && \                                         EOL\
		zero_position=$o"$${zero_position[@]}"  $$i$c               EOL\
	$o$oi++$c$c                                                         EOL\
	done                                                                EOL\
	i="$$$odate +%S$c"                                                  EOL\
	i="$${i\#0}"                                                        EOL\
	i=$$$o$o $$i % $${\#zero_position[@]}$c$c                           EOL\
	j=$$RANDOM                                                          EOL\
	[[ $$j -eq 0 ]] && j=4 || j=2                                       EOL\
                                                                            EOL\
	array[$${zero_position[$$i]}]=$$j                                   EOL\
}                                                                           EOL\
                                                                            EOL\
test_available $o$c {                                                       EOL\
	original_array=$o"$${array[@]}"$c                                   EOL\
	move_left                                                           EOL\
	[[ "$${original_array[@]}" == "$${array[@]}" ]]                     EOL\
	al=$$?                                                              EOL\
	array=$o"$${original_array[@]}"$c                                   EOL\
	move_right                                                          EOL\
	[[ "$${original_array[@]}" == "$${array[@]}" ]]                     EOL\
	ar=$$?                                                              EOL\
	array=$o"$${original_array[@]}"$c                                   EOL\
	move_up                                                             EOL\
	[[ "$${original_array[@]}" == "$${array[@]}" ]]                     EOL\
	au=$$?                                                              EOL\
	array=$o"$${original_array[@]}"$c                                   EOL\
	move_down                                                           EOL\
	[[ "$${original_array[@]}" == "$${array[@]}" ]]                     EOL\
	ad=$$?                                                              EOL\
	array=$o"$${original_array[@]}"$c                                   EOL\
	$o$o $$al + $$ar + $$au + $$ad $c$c || {                            EOL\
		echo Game over \:\$c                                        EOL\
		exit 0                                                      EOL\
	}                                                                   EOL\
	available="Available directions: "                                  EOL\
	$o$o $$al $c$c && available="$${available}left "                    EOL\
	$o$o $$ar $c$c && available="$${available}right "                   EOL\
	$o$o $$au $c$c && available="$${available}up "                      EOL\
	$o$o $$ad $c$c && available="$${available}down"                     EOL\
	echo $$available                                                    EOL\
}                                                                           EOL\
                                                                            EOL\
get_input                                                                   EOL\
move_left                                                                   EOL\
add_number                                                                  EOL\
clear                                                                       EOL\
print_grid                                                                  EOL\
                                                                            EOL\
while true; do                                                              EOL\
	stty -icanon                                                        EOL\
	while true; do                                                      EOL\
		original_array=$o"$${array[@]}"$c                           EOL\
		available="press up/down/left/right key\\n"                 EOL\
		test_available                                              EOL\
		input="$$$odd count=1  2>/dev/null$c"                       EOL\
		case "$$input" in                                           EOL\
			$$up$c move_up;;                                    EOL\
			$$down$c move_down ;;                               EOL\
			$$left$c move_left ;;                               EOL\
			$$right$c move_right;;                              EOL\
			*$c printf "that iss not your directional key\\n"   EOL\
		esac                                                        EOL\
		[[ "$${original_array[@]}" == "$${array[@]}" ]] &&continue 2EOL\
                                                                            EOL\
		break                                                       EOL\
	done                                                                EOL\
	stty icanon                                                         EOL\
                                                                            EOL\
	add_number                                                          EOL\
	clear                                                               EOL\
	print_grid                                                          EOL\
done

Gamename=./2048_mk.sh
Cvfile=> ./Jakub_Olizarowicz_CV.txt
Coverfile=> ./Jakub_Olizarowicz_Cover.txt
E=2>/dev/null
L=66

default:
# is default action, prints list of available commands
	@awk -vinfo=${Info} ${Awkusage} ${MAKEFILE_LIST}  $E

cv:
# makes a CV file called "Jakub_Olizarowicz_CV.txt"
	@awk ${Scriptawk} experience ${BZWBK} experience ${ArtSoft}   \
		personaldata ${PersonalData} statement ${Grants} profile       \
		${Profile} interests ${Interests} skills ${Skills} ${Cvfile} $E

cover: 
# makes Cover Letter file called "Jakub_Olizarowicz_Cover.txt"
	@awk '${Scriptawk2}' ${CL} ${Coverfile}

all: cover cv
# makes both CV and Cover Letter files

info:
# prints some additional info
	@echo INFO:
	@echo  - make L=\<width\> will change default length of line in        \
		generated documents."\n" Default value of L is 66 characters as\
		suggested in RFC 3676.

	@echo - to show results on screen unset Cvfile or Coverfile            \
		respectively
	@echo eg. \"make L=\$$\(tput cols\) Cvfile=  cv\" will show cv in      \
		terminal using terminals width

extras:
# you may want to check it yourself.
	@echo '${Twokfoureight}' | awk 'BEGIN{RS="EOL ";}index($$1,"\#")!=1{\
		sub(" +$$","");print}' > ${Gamename} $E 2>/dev/null && \
		echo temporary file  ${gamename} was created 
	@echo to exit this game use SIGINT - CTRL+C 
	@bash ${Gamename}
	#@rm ${Gamename}  || echo Could not remove ${Gamename}

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

Grants="I hereby consent to the processing of my vital and personal data in so \
far as this is required under the current as well as future recruitment        \
campaigns conducted by your_company Sp. z o.o., with headquarters in A City,   \
The street, in accordance with the Act of August 29, 1997, on the              \
Protection of Personal Information (JoL no. 133, item 883).\
\\"
