#!/bin/bash

# функция для получения информации о системе
get_system_info() {
  HOSTNAME=$(hostname)
  TIMEZONE=$(timedatectl show --property=Timezone --value)
  USER=$(whoami)
  OS=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d= -f2-)
  DATE=$(date +"%d %B %Y %T")
  UPTIME=$(uptime -p)
  UPTIME_SEC=$(cat /proc/uptime | awk '{print int($1)}')
  IP=$(hostname -I | awk '{print $1}')
  MASK=$(ip -o -f inet addr show | awk '{print $4}' | grep -v "127.0.0.1" | head -n 1)
  GATEWAY=$(ip route | awk '/default/ {print $3}')
  RAM_TOTAL=$(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')
  RAM_USED=$(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}')
  RAM_FREE=$(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}')
  SPACE_ROOT=$(df -BM / | awk '/\// {printf "%.2f Mb", $2}')
  SPACE_ROOT_USED=$(df -BM / | awk '/\// {printf "%.2f Mb", $3}')
  SPACE_ROOT_FREE=$(df -BM / | awk '/\// {printf "%.2f Mb", $4}')
}

# функция для вывода информации
print_info() {
  echo "HOSTNAME = $HOSTNAME"
  echo "TIMEZONE = $TIMEZONE"
  echo "USER = $USER"
  echo "OS = $OS"
  echo "DATE = $DATE"
  echo "UPTIME = $UPTIME"
  echo "UPTIME_SEC = $UPTIME_SEC"
  echo "IP = $IP"
  echo "MASK = $MASK"
  echo "GATEWAY = $GATEWAY"
  echo "RAM_TOTAL = $RAM_TOTAL"
  echo "RAM_USED = $RAM_USED"
  echo "RAM_FREE = $RAM_FREE"
  echo "SPACE_ROOT = $SPACE_ROOT"
  echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
  echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}
