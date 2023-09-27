# Функция для вывода информации о каталоге
print_directory_info() {
  local directory="$1"
  local total_folders=$(find "$directory" -type d 2>/dev/null | wc -l)
  local total_files=$(find "$directory" -type f 2>/dev/null | wc -l)
  local total_config_files=$(count_files_by_type "$directory" "conf")
  local total_text_files=$(count_files_by_type "$directory" "txt")
  local total_executable_files=$(count_files_by_type "$directory" "exe")
  local total_log_files=$(count_files_by_type "$directory" "log")
  local total_archive_files=$(count_files_by_type "$directory" "zip")
  local total_symlinks=$(count_symlinks "$directory")

  echo "Total number of folders (including all nested ones) = $total_folders"

  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  get_file_list_and_size "$directory" | awk '{printf "%d - %s, %.2f MB\n", NR, $2, $1/1024/1024}' | head -n 5

  echo "Total number of files = $total_files"
  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $total_config_files"
  echo "Text files = $total_text_files"
  echo "Executable files = $total_executable_files"
  echo "Log files (with the extension .log) = $total_log_files"
  echo "Archive files = $total_archive_files"
  echo "Symbolic links = $total_symlinks"

  echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  get_file_list_and_size "$directory" | awk '{printf "%d - %s, %.2f MB, %s\n", NR, $2, $1/1024/1024, system("file -b --mime-type " $2)}' | head -n 10

  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
  get_executable_file_list "$directory" | head -n 10
}
