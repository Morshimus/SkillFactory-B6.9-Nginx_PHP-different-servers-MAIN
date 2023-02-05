# SkillFactory-B6.9-Nginx_PHP-different-servers-MAIN

## Roles repository - https://github.com/Morshimus/SkillFactory-B6.9-Nginx_PHP-different-servers-Roles

## Задание 1:
* [x] - :one: ~~**Добавьте нового пользователя с авторизацией по ключу.**~~
 > Сделано неоднократно, далее написана усложненная роль под добавления Админов и Обычных юзеров. :sunglasses:
 
## Задание 2:
* [x] - :one: ~~**Поднимите nginx server.**~~
 > Reference link to project nginx_php https://github.com/Morshimus/SkillFactory-B6.9-Ansible-Nginx-Server-Main
 
## Задание 3 - 4:
* [x] - :one: ~~**Поднимите php-fpm на 9000 порту.**~~
  > Создана отдельная роль php с темплейтами www.conf. Где указано слушать порт 9000 для всех адресов. Так же указан адрес frontend сервера в данном случае это локалхост.

* [x] - :two: ~~**Укажите в nginx отправлять php на 9000 порт.**~~
  > Вместо привычного fastcgi_pass на локальный сокет, подключим сокет TCP на переменную PHP-FPM-SERVER - создана роль nginx с подобной установкой. В данном примере сервер localhost - 127.0.0.1:9000
  
$${\color{lightgreen}Заданиие\space со \space звездочкой}$$    

## Задание 5-6 :open_mouth:
 *PS - это было действительно сложно (не про задание, скорее про системы RedHat), учитывая что Selinux систем RedHat старается как можно более активно блокировать такие вещи, больше проблем было с ним, но это хороший опыт*
              ![](https://github.com/Morshimus/SkillFactory-B6.9-Nginx_PHP-different-servers-MAIN/blob/main/img/start.gif)
 
 * [x] - :one: ~~**Разделите tasks на роли:**~~
    - ~~*«Добавьте нового пользователя с авторизацией по ключу» — роль «users».*~~
      - ~~*«Поднимите nginx server», «Укажите в nginx отправлять php на 9000 порт» — роль «http».*~~
        - ~~*«Поднимите php-fpm», «Укажите php-fpm принимать на 9000 порт»— роль «php».*~~
   
   > Написаны роли users_mgmt, php, nginx. Роли протестированы на молекуле. Для молекулы написаны тесты - test_port, test_nginx, test_php. Выгрузка успешных тестов ниже.
   
   > Nginx - молекула тестирует открыт ли порт, так же тестирует пропускает ли nginx fastcgi (скачивая php-fpm по ключу molecule_yml и подбрасывая ему index.php)
   ![image](https://db3pap003files.storage.live.com/y4mJrYMQ6EqEq54MVdjD1-Vzt1htgfrk-A3yNSoBl0aB5l_FC-CpsRoNj4yk2LhPaFu6H-izr7-V0hq5MYtiEWs8WRawNp4QVGmCW_BaQzssevrx58eYrT_jc489GGC4uM3c27YtHd0OEUr3z0VXJ0JHpVas2_HMWSiJ2jhk9k8LLSuNAjDI1B44WjQi3wwOr48f7wIGtEJoGTOqaMF5vHUZQ/Molecule-Nginx-Tests-1.jpg?psid=1&width=996&height=802)
   ![image](https://db3pap003files.storage.live.com/y4mHu6bjaBFccLzPhmZgDJ8_TQrutFWHLKu1897jUqe2EONAKYV5TUqT0gCUXDBffV3fbaWZ0Q6vdKXnufAR7v87kjUetopgscVvvmE1c5sQ4Kygmo4qCuhMXLVqs3BIRmcHY8nUNWhnaCfwxZ-INfKEkuKha9MB-5wIxSRj8lx0DIepHca1o4-qc_yOi7aE-gM6MMro1q9Cts5qRbe0FjfJw/Molecule-Nginx-Verify-2.jpg?psid=1&width=1218&height=802)
   
   > Php - молекула тестирует открыт ли порт, и тестирует правильность конфигурации php-fpm -t.
   ![image](https://db3pap003files.storage.live.com/y4mw5pbgJa5g74-wQSKifew1-K1pDzf3t7ajIoyAN14OfaZifzY2DTA1wkf9qlBKD118qp5km8TX1A2_mJJ9pZ6X94WCGZZ3bZATKN419f7TBwx_prpphUBGv7w5muQTCLOr493A28ChI9ssBfOHq5l8-EDPOp4KIxF2r5JH-Q6bKyxzJLNgn5bnPxV-fSmR4ZffCPoyhnVsDvBWh3x077viw/Molecule-PHP-Tets-1.jpg?psid=1&width=1061&height=756)
   ![image](https://db3pap003files.storage.live.com/y4m7tGgk5kTV81lFbWp9MlXp2QjbOmSf1PbUV6bLc1lSGKQkUCaPGLPZ0JlJskzwdiEev9tBAiaB5jZpDaSRz640M32DWovUsTX-3Ttw9ScnsuUIVvpPYxvL37EYVhcJDqYUdIHGui_v2bozoSInMzshcg9Z0HgCZFAg_MdVq-QeFR-zUeApZPI58VNrphweDlfVBar6SVUlldVFG0a4fH3eg/Molecule-PHP-Verify-2.jpg?psid=1&width=1167&height=611)
   
 ## Скриншот бэкенд cgi будет после финального задания. 
 
 * [x] - :two: ~~**Поднимите nginx и php-fpm на разных серверах:**~~
    - ~~*Для nginx сервера используйте роль «users» «http».*~~
      - ~~*Для php-fpm сервера используйте роль «users» «php».*~~
   > Селали конфигурацию терраформ с динамическим темлейтом ansible_inventory_template который разделяет наши машины на backend и frontend, и создает файл инветори yandex_cloud.ini. Проверили pre-commit хуком, исправили ошибки. Далее скриншот работы playbook с использованием наших ролей.
![image](https://db3pap003files.storage.live.com/y4m86PFQQ3TgxyKrvg255QCE89lcW8VVz0u2tTvOqt0NlrYmqLEagf4l5esDvdlIDimJP4PVTnLtk2PJa9HdWRtMop1p1dhsQr-NBZwEJ-ph0aYBSXT6XVAuxhl4IWE9VGK8TtvwrPQpnfW3mCrddUIdWSazfiptn7bhddb4DAlRmP5xTJriu2Cxcq_44d_yA1V8bm_nZrEQGmseQrhA-x99Q/Ansible-Different-Servers-Nginx-PHP-console-1.jpg?psid=1&width=1230&height=750)
![image](https://db3pap003files.storage.live.com/y4mOcXdpHY61i-ySKTIKECXbYCGjeUz8gdXmVKCqypSgkvqjicgVesFaRfsVY6emnWUcnEnlkA4C5aWbza2utJeA_Oh7KYZ3EdUrpnuB2x9MT7Y-Gp5eHGoCe2ltRpG7ynkK0NzUwlviMglDK2M2iUw1-zS2lPEY3Y0RNkAWq9OZuxToIOQX0GZaNUNyxFz-loSBGOVe7NXioaSamMu20RkFg/Ansible-Different-Servers-Nginx-PHP-console-2.jpg?psid=1&width=1225&height=727)
![image](https://db3pap003files.storage.live.com/y4mVa02dts_eKXbpnwDrXN3jrcuodPVnb7QcxieelNk27l09SOfO_hyIuOZPhMrItmDMtNF3ZEc73nlj_K_lhaMnXT7hYnOAJGxR2eWAMEDxymuT_5mfZA_MvVr3-7VCqTrs8ya9MZkfHSWiOLRaqZYIS3_GpLkOAN3r59VlrDvCbWEJEhot59_0Ckzmea3HOt_k3ekYZ_M3WdJ139SUt-A5w/Ansible-Different-Servers-Nginx-PHP-console-3.jpg?psid=1&width=1227&height=748)
 ![image](https://db3pap003files.storage.live.com/y4mc27Z3t5dT1ySrmrOQ7iI2u8UU5ZemxaCcoTrpOacufMICzsxWocNslD4tk7JsAK3ghuyD7UrblcgYDJbjYwShbUCLwsHVQ3BMmnrmBM7hhojUhSTu7w4mb0j20Nfeu4sD6Ga8525Pt9uze4DldYXdTMEXjXjW8Xqwc-D4qKpWM9u-fZub4y4zLtL_x_aeWAt_guC11-RqKfY2-loCJKrjA/Ansible-Different-Servers-Nginx-PHP-console-4.jpg?psid=1&width=1240&height=485)
 
 
 # And :dizzy_face: .....
 
 > It's working
 ![image](https://db3pap003files.storage.live.com/y4m6Ob529aAE80qPlz-UU2ZFJGt4cVnkrcamYJZw0ZOlaimHI6mZqbUucFZjkq2bhXskJ6DuiRRzqMaGqrgDPz3OUgLmwrYLxN425ttQktMUFE1HqSd6F7zFa1Vn8yhVoAaQKFDTVrD2C_1x1_dq2bPljCcL4v6XMx-_-ApAHDcuoi25Z2hMNv2bsa8cIrGEhZYiYgkRbzjOAONBmBxryp0iQ/php-backend.jpg?psid=1&width=1308&height=802)
 
 ![](https://github.com/Morshimus/SkillFactory-B6.9-Nginx_PHP-different-servers-MAIN/blob/main/img/finish.gif)
 
 > Ниже terraform-doc
 
  
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.5 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.3.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | ~> 0.84.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.3.0 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.84.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_morsh_instance_ya_1"></a> [morsh\_instance\_ya\_1](#module\_morsh\_instance\_ya\_1) | ./INSTANCE | n/a |
| <a name="module_morsh_instance_ya_2"></a> [morsh\_instance\_ya\_2](#module\_morsh\_instance\_ya\_2) | ./INSTANCE | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.yc_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [yandex_vpc_network.morsh-network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.morsh-subnet-a](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id_yandex"></a> [cloud\_id\_yandex](#input\_cloud\_id\_yandex) | Cloud id of yandex.cloud provider | `string` | n/a | yes |
| <a name="input_folder_id_yandex"></a> [folder\_id\_yandex](#input\_folder\_id\_yandex) | Folder id of yandex.cloud provider | `string` | n/a | yes |
| <a name="input_network_name_yandex"></a> [network\_name\_yandex](#input\_network\_name\_yandex) | Created netowork in yandex.cloud name | `string` | n/a | yes |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Size of required vm | `string` | `"12"` | no |
| <a name="input_service_account_key_yandex"></a> [service\_account\_key\_yandex](#input\_service\_account\_key\_yandex) | Local storing service key. Not in git tracking | `string` | `"./key.json"` | no |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | OS family of image | `string` | `"centos-stream8"` | no |
| <a name="input_subnet_a_description_yandex"></a> [subnet\_a\_description\_yandex](#input\_subnet\_a\_description\_yandex) | n/a | `string` | `"Subnet A for morshimus instance A"` | no |
| <a name="input_subnet_a_name_yandex"></a> [subnet\_a\_name\_yandex](#input\_subnet\_a\_name\_yandex) | Subnet for 1st instance | `string` | `"morsh-subnet-a"` | no |
| <a name="input_subnet_a_v4_cidr_blocks_yandex"></a> [subnet\_a\_v4\_cidr\_blocks\_yandex](#input\_subnet\_a\_v4\_cidr\_blocks\_yandex) | IPv4 network for 1st instance subnet | `list(string)` | <pre>[<br>  "192.168.21.0/28"<br>]</pre> | no |
| <a name="input_useros"></a> [useros](#input\_useros) | OS native default user | `string` | `"cloud-user"` | no |
| <a name="input_zone_yandex_a"></a> [zone\_yandex\_a](#input\_zone\_yandex\_a) | Zone of 1st instance in yandex cloud | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_vm_1"></a> [external\_ip\_address\_vm\_1](#output\_external\_ip\_address\_vm\_1) | n/a |
| <a name="output_external_ip_address_vm_2"></a> [external\_ip\_address\_vm\_2](#output\_external\_ip\_address\_vm\_2) | n/a |
| <a name="output_hostname_vm_1"></a> [hostname\_vm\_1](#output\_hostname\_vm\_1) | n/a |
| <a name="output_hostname_vm_2"></a> [hostname\_vm\_2](#output\_hostname\_vm\_2) | n/a |
| <a name="output_internal_ip_address_vm_1"></a> [internal\_ip\_address\_vm\_1](#output\_internal\_ip\_address\_vm\_1) | n/a |
| <a name="output_internal_ip_address_vm_2"></a> [internal\_ip\_address\_vm\_2](#output\_internal\_ip\_address\_vm\_2) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
