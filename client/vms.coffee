Template.vms.vms = () ->
  Vms.find().map (vm) ->
    vm.ip = vm.ips[0]

    if vm.vitals and vm.vitals.cpu
      total_cpu = parseFloat(vm.vitals.cpu.user) + parseFloat(vm.vitals.cpu.wait) + parseFloat(vm.vitals.cpu.sys)
      vm.cpu = "#{Math.round(total_cpu, 1)}%"
    else
      vm.cpu = '-'

    if vm.vitals and vm.vitals.mem
      vm.mem = vm.vitals.mem.percent + '%'
    else
      vm.mem = '-'

    if vm.vitals and vm.vitals.disk and vm.vitals.disk.persistent
      vm.disk = vm.vitals.disk.persistent.percent + '%'
    else
      vm.disk = '-'

    if vm.job_state in ['running']
      vm.job_state_class = 'vm-good'
    else
      vm.job_state_class = 'vm-bad'
    vm
