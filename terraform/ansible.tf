resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftpl", {
    controlplane_ips = aws_instance.kubernetes_ec2_master.*.public_ip,
    worker_ips       = aws_instance.kubernetes_ec2_worker.*.public_ip
  })
  filename = "${path.module}/../ansible/inventory"
}