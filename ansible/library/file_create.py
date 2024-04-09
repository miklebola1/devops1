#!/usr/bin/python

from ansible.module_utils.basic import AnsibleModule
import os


def main():
    module = AnsibleModule(
        argument_spec=dict(
            path=dict(required=True, type='str'),
        )
    )

    path = module.params['path']

    for root, dirs, files in os.walk(path):
        for dir in dirs:
            touch_path = os.path.join(root, dir, '.dont-touch.me')
            try:
                with open(touch_path, 'w') as file:
                    pass
            except Exception as e:
                module.fail_json(msg=f"Failed to create file at {touch_path}: {e}")

    module.exit_json(changed=True)


if __name__ == '__main__':
    main()

