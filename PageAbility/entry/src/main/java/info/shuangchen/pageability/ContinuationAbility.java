package info.shuangchen.pageability;

import info.shuangchen.pageability.slice.ContinuationAbilitySlice;
import info.shuangchen.pageability.slice.ContinuationAbilitySlice2;
import ohos.aafwk.ability.Ability;
import ohos.aafwk.ability.IAbilityContinuation;
import ohos.aafwk.content.Intent;
import ohos.aafwk.content.IntentParams;
import ohos.bundle.IBundleManager;
import ohos.security.SystemPermission;

/**
 * 跨设备迁移，这里使用固定写法，因为只申请了一个权限
 */
public class ContinuationAbility extends Ability implements IAbilityContinuation {

    public static final String ACTION_CONTINUATION2 = "CONTINUATION_ABILITY_SECOND_SLICE2_ACTION";
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setMainRoute(ContinuationAbilitySlice.class.getName());
        super.addActionRoute(ACTION_CONTINUATION2, ContinuationAbilitySlice2.class.getName());
        requestPermissions();
    }

    private void requestPermissions() {
        if (verifySelfPermission(SystemPermission.DISTRIBUTED_DATASYNC) != IBundleManager.PERMISSION_GRANTED) {
            requestPermissionsFromUser(new String[] {SystemPermission.DISTRIBUTED_DATASYNC}, 0);
        }
    }

    @Override
    public boolean onStartContinuation() {
        return true;
    }

    @Override
    public boolean onSaveData(IntentParams intentParams) {
        return true;
    }

    @Override
    public boolean onRestoreData(IntentParams intentParams) {
        return true;
    }

    @Override
    public void onCompleteContinuation(int code) {
        terminateAbility();
    }

    @Override
    public void onRequestPermissionsFromUserResult(int requestCode, String[] permissions, int[] grantResults) {
        if (permissions == null || permissions.length == 0 || grantResults == null || grantResults.length == 0) {
            return;
        }
        if (requestCode == 0) {
            if (grantResults[0] == IBundleManager.PERMISSION_DENIED) {
                terminateAbility();
            }
        }
    }
}
