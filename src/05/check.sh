# Функция для проверки количества аргументов
check_args() {
  if [ $# -ne 1 ]; then
    echo "Error: введите $0 <directory_path>"
    exit 1
  fi
}

# Функция для проверки существования и типа директории
check_directory() {
  local dir="$1"
  if [ ! -d "$dir" ]; then
    echo "Error: '$dir' несуществует."
    exit 1
  fi
}