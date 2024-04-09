#!/usr/bin/python

from ansible.plugins.callback import CallbackBase

class CallbackModule(CallbackBase):
    CALLBACK_VERSION = 2.0
    CALLBACK_TYPE = 'stdout'
    CALLBACK_NAME = 'user_group_format'

    def v2_runner_on_ok(self, result):
        if result.task_name == "Users info":
            self._display.banner("Список пользователей и их групп")
            groups_info = result._result['ansible_facts']['getent_group']
            for group, ginfo in groups_info.items():
                users = ','.join(ginfo[3])  # ginfo[3] содержит список пользователей группы
                self._display.display(f"{group}: {users}")

