alias vim='nvim'
alias cdw='cd /mnt/c/Users/Flori/Workspace'
alias py='python3'
alias removetmp='cd .. && rm -r tmp'

#strings
pstring="def main():
    print(\"Hello World\")

if __name__ == \"__main__\":
    main()
"

cstring="#include <iostream>

int main() {

	std::cout << \"Hello World\" << std::endl;
	return 0;
}"

compile="g++ main.cpp -o main -std=c++2a"

run="clear

echo -e \"\e[1;34mStart compiling.. \e[0m\"

if ./compile; then
	echo -e \"\e[1;32mFinished compiling.. \e[0m\"
	echo -e \"\"
	echo -e \"\e[1;34mShow compiled.. \e[0m\"
	echo -e \"\"
	if test -e ./main; then
		./main
	elif test -e ./main.exe; then
		./main.exe
	fi
	echo -e \"\"
else
	echo -e \"\e[1;31mFailed compiling.. \e[0m\"
fi
"

mkcdir () {
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

mkwdir () {
	if [ "$2" = "c++" ]; then
		mkdir -p -- "$1" && cd -P -- "$1" && touch main.cpp
		echo "$cstring" >> main.cpp
		echo "$compile" >> compile
		echo "$run" >> run
		chmod +x compile
		chmod +x run
		vim +5 main.cpp
	elif [ "$2" = "python" ]; then
		mkdir -p -- "$1" && cd -P -- "$1" && touch main.py
		touch main.py
		echo "$pstring" >> main.py
		vim +2 main.py
	fi
}

updategit() {
	echo "
#Für Florian
compile
run" >> .gitignore
}

openeis() {
	xdg-open https://luna.informatik.uni-mainz.de/eis20/
}
