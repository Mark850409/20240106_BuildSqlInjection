chcp 65001

cd /d python
echo %BUILD_NUMBER%
SET BUILD_NUMBER=%BUILD_NUMBER%


for /f %%i in ('docker ps --format "{{.Names}}"') do If not "%%i" == "" (
    docker stop %%i
    docker rm -f %%i
    docker rmi %%i:%BUILD_NUMBER%
  ) else (
    echo "No Container running"
)

docker pull cutecat1134/sqlinjection
docker run -d --name victim -p 80:80 cutecat1134/sqlinjection
docker exec victim bash -c "sh lampp.sh"
pause