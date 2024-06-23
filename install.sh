tools_dir=$1
domain=$2

mkdir -p ${tools_dir}/nexus

sed -i -E "s/domain:.*/domain: ${domain}/g" ./hosts.yml
sed -i -E "s/tools_dir:.*/tools_dir: ${tools_dir}/g" ./hosts.yml

# Nginx - Nexus
echo "Up Nginx ..."
ansible-playbook -i hosts.yml nginx_nexus.yml

# Nexus
echo "Copy Nexus docker images ..."
rsync  -qazhPW --inplace  --progress ./nexus.volumes ${tools_dir}/nexus/

echo "Up Nexus ..."
ansible-playbook -i hosts.yml nexus.yml

# Nginx - Matrix
sleep 120
ansible-playbook -i hosts.yml nginx_matrix.yml

# Matrix
ansible-playbook -i hosts.yml matrix.yml

# Jitsi
ansible-playbook -i hosts.yml jitsi.yml
