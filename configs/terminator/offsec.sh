## ad-windows
mkdir /opt/ad-windows

pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec

mkdir /opt/ad-windows/bloodhound-compose
wget -O /opt/ad-windows/bloodhound-compose https://raw.githubusercontent.com/SpecterOps/BloodHound/refs/heads/main/examples/docker-compose/docker-compose.yml

pipx install bloodhound-ce

mkdir /opt/ad-windows/bloodyAD
python3 -m venv /opt/ad-windows/bloodyAD
source /opt/ad-windows/bloodyAD/bin/activate
pip install bloodyAD
deactivate

mkdir /opt/ad-windows/certipy
python3 -m venv /opt/ad-windows/certipy
source /opt/ad-windows/certipy/bin/activate
pip install certipy-ad
deactivate

mkdir /opt/ad-windows/coercer
python3 -m venv /opt/ad-windows/coercer
source /opt/ad-windows/coercer/bin/activate
pip install coercer
deactivate

mkdir /opt/ad-windows/enum4linux-ng
git clone https://github.com/cddmp/enum4linux-ng.git /opt/ad-windows/enum4linux-ng
python3 -m venv /opt/ad-windows/enum4linux-ng
source /opt/ad-windows/enum4linux-ng/bin/activate
pip install -r /opt/ad-windows/enum4linux-ng/requirements.txt
deactivate

cd /opt/ad-windows
git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git

mkdir /opt/ad-windows/impacket
git clone https://github.com/fortra/impacket.git /opt/ad-windows/impacket
python3 -m venv /opt/ad-windows/impacket
source /opt/ad-windows/impacket/bin/activate
pip install -r /opt/ad-windows/impacket/requirements.txt
deactivate

go get github.com/ropnop/kerbrute

mkdir /opt/ad-windows/krbrelayx
git clone https://github.com/dirkjanm/krbrelayx.git /opt/ad-windows/krbrelayx

apt-get install -y libkrb5-dev krb5-config gcc python3-dev
python -m pip install ldeep

mkdir /opt/ad-windows/petitpotam
git clone https://github.com/topotam/PetitPotam /opt/ad-windows/petitpotam

mkdir /opt/ad-windows/PowerSharpPack
git clone https://github.com/S3cur3Th1sSh1t/PowerSharpPack.git /opt/ad-windows/PowerSharpPack

mkdir /opt/ad-windows/PowerUpSQL
git clone https://github.com/NetSPI/PowerUpSQL.git /opt/ad-windows/PowerUpSQL


mkdir /opt/ad-windows/pywhisker
git clone https://github.com/ShutdownRepo/pywhisker.git /opt/ad-windows/pywhisker
python3 -m venv /opt/ad-windows/pywhisker
source /opt/ad-windows/pywhisker/bin/activate
pip install -r /opt/ad-windows/pywhisker/requirements.txt
deactivate

mkdir /opt/ad-windows/responder
git clone https://github.com/lgandx/Responder.git /opt/ad-windows/responder
python3 -m venv /opt/ad-windows/responder
source /opt/ad-windows/responder/bin/activate
pip install -r /opt/ad-windows/responder/requirements.txt
deactivate

mkdir /opt/ad-windows/RunasCs
git clone https://github.com/antonioCoco/RunasCs.git /opt/ad-windows/RunasCs

mkdir /opt/ad-windows/rusthound
cd /opt/ad-windows/rusthound
git clone https://github.com/NH-RED-TEAM/RustHound.git
make install

wget -O /opt/ad-windows/SharpHound.zip "https://github.com/SpecterOps/SharpHound/releases/download/v2.9.0/SharpHound_v2.9.0_windows_x86.zip"

mkdir /opt/ad-windows/targetedKerberoast
git clone https://github.com/ShutdownRepo/targetedKerberoast.git /opt/ad-windows/targetedKerberoast
python3 -m venv /opt/ad-windows/targetedKerberoast
source /opt/ad-windows/targetedKerberoast/bin/activate
pip install -r /opt/ad-windows/targetedKerberoast/requirements.txt
deactivate

cd /opt/ad-windows/
git clone https://github.com/ParrotSec/mimikatz.git
git clone https://github.com/peass-ng/PEASS-ng.git
wget https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.7/LaZagne.exe

## Cracking
mkdir /opt/cracking

cd /opt/cracking
git clone https://github.com/openwall/john.git
python3 -m venv .
source ./bin/activate
pip3 install -r requirements.txt
deactivate

apt install hashcat

cd /opt/cracking
git clone https://github.com/urbanadventurer/username-anarchy.git

## pivot
mkdir /opt/pivot

cd /opt/pivot
git clone https://github.com/jpillora/chisel.git
git clone https://github.com/nicocha30/ligolo-ng.git

## Linux
mkdir /opt/linux

cd /opt/linux
wget "https://github.com/peass-ng/PEASS-ng/releases/download/20260212-43b28429/linpeas.sh"
git clone https://github.com/ly4k/PwnKit.git
git clone https://github.com/liamg/traitor.git


#### Web
mkdir /opt/web

apt install sqlmap wpscan

cd /opt/web
git clone https://github.com/devanshbatham/paramspider
git clone https://github.com/ticarpi/jwt_tool.git
git clone https://github.com/arthaud/git-dumper.git

## Misc
apt install nmap