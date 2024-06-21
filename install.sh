tools_dir=$1
domain=$2

mkdir -p ${tools_dir}/nexus

# Nginx - Nexus
echo "Up Nginx ..."
sed -i -E "s/domain:.*/domain: ${domain}/g" ./nginx/ansible/hosts.yml
sed -i -E "s/tools_dir:.*/tools_dir: ${tools_dir}/g" ./nginx/ansible/hosts.yml
cd ./nginx/ansible/
ansible-playbook -i hosts.yml nginx_nexus.yml

# Nexus
echo "Copy Nexus docker images ..."
rsync  -qazhPW --inplace  --progress ./nexus/volumes ${tools_dir}/nexus/

echo "Up Nexus ..."
sed -i -E "s/tools_dir:.*/tools_dir: ${tools_dir}/g" ./nexus/ansible/hosts.yml
cd ./nexus/ansible/
ansible-playbook -i hosts.yml nexus.yml

# Nginx - Matrix
sleep 120
ansible-playbook -i hosts.yml nginx_matrix.yml
