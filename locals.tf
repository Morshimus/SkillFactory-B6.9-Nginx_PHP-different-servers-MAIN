locals {

  ansible_template = templatefile(
    "${path.module}/templates/ansible_inventory_template.tpl",
    {
      user      = var.useros,
      ip1       = module.morsh_instance_ya_1.external_ip_address_morsh_bastion,
      hostname1 = module.morsh_instance_ya_1.hostname_morsh_bastion,
      ip2       = module.morsh_instance_ya_2.external_ip_address_morsh_bastion,
      hostname2 = module.morsh_instance_ya_2.hostname_morsh_bastion


    }
  )



}