Template.vms.vms = () ->
  Vms.find().map (vm) ->
    vm.ip = vm.ips[0]
    total_cpu = parseFloat(vm.vitals.cpu.user) + parseFloat(vm.vitals.cpu.wait) + parseFloat(vm.vitals.cpu.sys)
    vm.vitals.cpu.total = Math.round(total_cpu, 1)
    vm
