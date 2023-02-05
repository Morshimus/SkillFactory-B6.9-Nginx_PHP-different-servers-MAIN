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
  > Создана отдельная роль php с темплейтами www.conf. Где указано слушать порт 9000 для всех адресов. Так же указан адрес fronend сервера в данном случае это локалхост.

* [x] - :two: ~~**Укажите в nginx отправлять php на 9000 порт.**~~
  > Вместо привычного fastcgi_pass на локальный сокет, подключим сокет TCP на переменную PHP-FPM-SERVER - создана роль nginx с подобной установкой. В данном примере сервер localhost - 127.0.0.1:9000
  
$${\color{lightgreen}Заданиие\space со \space звездочкой}$$    

## Задание 5-6 :open_mouth:
 *PS - это было действительно сложно (не про задание, скорее про системы RedHat), учитывая что Selinux систем RedHat старается как можно более активно блокировать такие вещи, больше проблем было с ним - но это хороший опыт*
              ![](https://github.com/Morshimus/SkillFactory-B6.9-Nginx_PHP-different-servers-MAIN/blob/main/img/start.gif)
 
 * [x] - :one: ~~**Разделите tasks на роли:**~~
    - ~~*«Добавьте нового пользователя с авторизацией по ключу» — роль «users».*~~
      - ~~*«Поднимите nginx server», «Укажите в nginx отправлять php на 9000 порт» — роль «http».*~~
        - ~~*«Поднимите php-fpm», «Укажите php-fpm принимать на 9000 порт»— роль «php».*~~
   
   > Написаны роли users_mgmt, php, nginx. Роли протестированы на молекуле. Для молекулы написаны тесты - test_port, test_nginx, test_php. Выгрузка успешных тустов ниже.
   ![image]()
   ![image]()
   ![image]()

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
