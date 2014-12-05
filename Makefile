
INFO="Hi,                                                    \
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
\       \
\\" 
PI=3.14

default:
# is default action, prints list of available commands
	@awk -vinfo=${INFO} 'BEGIN{                                            \
			gsub("\t","\n\t",info);                                \
			print info;                                            \
			print "Available commands" }                           \
		!/^[^\tA-Z\\]/{                                                \
			next                                                   \
		}                                                              \
		{                                                              \
			rule=$$1;                                              \
			getline;                                               \
			$$1=rule;                                              \
			sub(":"," -> ",$$1)                                    \
		}                                                              \
		${PI}' ${MAKEFILE_LIST} 2>/dev/null                            \
		# 2>/dev/null to avoid 'treat \\ as \' messages

cv:
# makes a CV file called "Jakub Olizarowicz CV.txt", yep, with spacebars


cover: 
# makes Cover Letter file called "Jakub_Olizarowicz_CL.txt" no spaces
