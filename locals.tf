locals {

  ansible_template = templatefile(
    "${path.module}/templates/ansible_inventory_template.tpl",
    {
      user     = var.useros,
      ip       = module.morsh_instance_ya_1.external_ip_address_morsh_bastion,
      hostname = module.morsh_instance_ya_1.hostname_morsh_bastion

    }
  )



}