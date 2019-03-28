Ansible role to install and configure AWS Systems Manager Agent on both Windows and Linux

[![Build Status](https://travis-ci.org/riponbanik/ansible-role-aws-ssm-agent.svg?branch=master)](https://travis-ci.org/riponbanik/ansible-role-aws-ssm-agent)

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):


AWS allows monitoring windows metrics and logs via cloudwatch plugin - disabled by default
```
cloudwatch_monitoring: false
cloudwatch_namespace: 'Windows/Default'
cloudwatch_log_group: 'Default-Log-Group'

application_event_log_level: 3
system_event_log_level: 3
security_event_log_level: 1
```

Prevent download and upgrade of the package if not changed 
```
force_upgrade: no
```

Allows to use custom cloudwatch template e.g. the following can be put same level as the playbook
```
aws_ssm_config_template_path: 'templates/CloudwatchWindowsPlugin.json'
```

Activation for Multi-Accout or On-Prem setup
```
aws_ssm_activation_code: 1234567890
aws_ssm_activation_id: 1234567890
ws_ssm_ec2_region: ap-southeast-2
```

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
        - { role: riponbanik.aws-ssm-agent }

## License

MIT / BSD

## Author Information

This role was created in 2018 by [Ripon Banik ](https://www.linkedin.com/in/ripon-banik-79956b23/)
