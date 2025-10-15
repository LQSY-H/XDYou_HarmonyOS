/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { preferences } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const KEY_APP_FONT_SIZE = 'appFontSize';
const KEY_LOGIN_STATE = 'appLoginState'
const TAG = 'PreferencesUtil';

/**
 * The PreferencesUtil provides preferences of create, save and query.
 */
export class PreferencesUtil {
  preference?: preferences.Preferences;

  getFontPreferences(context: Context) {
    this.preference = preferences.getPreferencesSync(context, { name: 'FontPreferences' });
    hilog.info(0x0000, TAG, 'create success');
  }

  saveChangeFontSize(fontSizeOffset: number) {
    this.preference?.putSync(KEY_APP_FONT_SIZE, fontSizeOffset);
    this.preference?.flush(
      (err: BusinessError) => {
        if (err) {
          hilog.error(0x0000, TAG, 'Failed to flush. code =' + err.code + ', message =' + err.message);
          return;
        }
        hilog.info(0x0000, TAG, 'Succeeded in flushing.');
      });
  }

  getChangeFontSize() {
    let fontSizeOffset: number = 0;
    fontSizeOffset = this.preference?.getSync(KEY_APP_FONT_SIZE, 0) as number;
    return fontSizeOffset;
  }

  isKeyExist(): boolean {
    let isKeyExist: boolean = false;
    this.preference?.has(KEY_APP_FONT_SIZE).then(async (isExist: boolean) => {
      isKeyExist = isExist;
    }).catch((err: Error) => {
      hilog.error(0x0000, TAG, 'Has the value failed with err: ' + err);
    });
    return isKeyExist;
  }

  getInputAccount(context: Context) {
    this.preference = preferences.getPreferencesSync(context, { name: 'AccountPreferences' });
  }

  saveInputAccount(accountInput: string) {
    this.preference?.putSync('inputAccount', accountInput);
    this.preference?.flush()
  }

  getChangeInputAccount() {
    let inputAccount: string = '';
    inputAccount = this.preference?.getSync('inputAccount', '') as string;
    return inputAccount;
  }

  isAccountExist(): boolean {
    let isAccountExist: boolean = false;
    this.preference?.has('inputAccount').then(async (isExist: boolean) => {
      isAccountExist = isExist;
    })
    return isAccountExist;
  }

  getInputPassword(context: Context) {
    this.preference = preferences.getPreferencesSync(context, { name: 'PasswordPreferences' });
  }

  saveInputPassword(passwordInput: string) {
    this.preference?.putSync('inputPassword', passwordInput);
    this.preference?.flush()
  }

  getChangeInputPassword() {
    let inputPassword: string = '';
    inputPassword = this.preference?.getSync('inputPassword', '') as string;
    return inputPassword;
  }

  isPasswordExist(): boolean {
    let isPasswordExist: boolean = false;
    this.preference?.has('inputPassword').then(async (isExist: boolean) => {
      isPasswordExist = isExist;
    })
    return isPasswordExist;
  }

  async saveLoginState(state: boolean) {
    try {
      await this.preference?.put(KEY_LOGIN_STATE, state)
      await this.preference?.flush()
    } catch (err) {
      console.error(TAG, 'saveLoginState failed: ' + err)
    }
  }

  getLoginState() {
    let LoginState: boolean = false;
    LoginState = this.preference?.getSync('KEY_LOGIN_STATE', false) as boolean;
    return LoginState;

  }
}

export default new PreferencesUtil();