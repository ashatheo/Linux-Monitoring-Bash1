#!/bin/bash

# функция для записи информации в файл
write_to_file() {
  local time=$(date +"%d_%m_%y_%H_%M_%S")
  local filename="${time}.status"

  read -p "Сохранить файл? (Y/N)" answer
  if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
    print_info > "$filename"
    echo "Сохранено: $filename"
  else
    echo "GoodBye."
  fi
}
