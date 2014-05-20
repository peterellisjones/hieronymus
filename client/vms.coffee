Template.vms.vms = () ->
  Vms.find().map (vm) ->
    vm.ip = vm.ips[0]
    if vm.vitals and vm.vitals.cpu and vm.vitals.mem
      total_cpu = parseFloat(vm.vitals.cpu.user) + parseFloat(vm.vitals.cpu.wait) + parseFloat(vm.vitals.cpu.sys)
      vm.cpu = Math.round(total_cpu, 1)
      vm.mem = vm.vitals.mem.percent
    else
      vm.cpu = '-'
      vm.mem = '-'
    vm

Template.vms.rendered = () ->
  $('table.vms').tablesorter()
