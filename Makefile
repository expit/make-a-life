
Info="Hi,                                                    \
\	this is Curriculum Vitae and Cover Letter generator  \
\	by Jakub Olizarowicz.                                \ 
\	If you are HR employee and don't know what to do     \
\	with it you may ask some IT employee (linux user or  \
\	developer would be recommended) how to 'make' it or  \
\	just forget about my application.                    \
\	But please, do let me know if you did the latter one \
\	by mailing me: jakub@olizarowicz.pl                  \
\                                                            \
\	Reuirements:                                         \
\	- make (tested with GNU Make 3.81)                   \
\	- bash (at least 3.0)                                \
\	- awk (any awk, code used in this code is portable)  \
\                                                            \
\	Usage:                                               \
\	save as Makefile makefile or                         \
\                                                            \
\	The rest of the file is actual Makefile script and   \
\	is not meant to be read by human.                    \
\	Thanks for reading so far.                           \
\                                                            \
\\"

#Setting "magic" Pi constant
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

default:
# is default action, prints list of available commands
        @awk -vinfo=${Info} ${Awkusage} ${MAKEFILE_LIST} 2>/dev/null

cv: Cvparts
# makes a CV file called "Jakub Olizarowicz CV.txt", yep, with spacebars

cover: Coverparts
# makes Cover Letter file called "Jakub_Olizarowicz_CL.txt" no spaces
        echo "${Cover}"

coverinteractive: InteractiveCoverPart Coverparts                                          
# makes Cover Letter asking few questions
        echo "${Cover}"

InteractiveCoverPart:
Interactive="y"

Salutation:
ifdef Interactive
        echo please enter your name
name=$(read n)
Cover=Dear name "${name}"
else
Cover=Dear Sir or Madam
endif

Body1: Salutation
Body2: Body1
Body3: Body2
Close: Body3

Coverparts: Salutation Body1 Body2 Body3 Close

Cvparts: Who Profile Experience Education Skills Interests References

