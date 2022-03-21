package info.shuangchen.pageability.slice;

import info.shuangchen.pageability.ResourceTable;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.ability.IAbilityContinuation;
import ohos.aafwk.content.Intent;
import ohos.aafwk.content.IntentParams;
import ohos.agp.components.Component;

public class ContinuationAbilitySlice2 extends AbilitySlice implements IAbilityContinuation {
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setUIContent(ResourceTable.Layout_ability_continuation);
        initComponents();
    }

    private void initComponents() {
    }

    private void migrateAbility(Component component) {

    }

    @Override
    public boolean onStartContinuation() {
        return false;
    }

    @Override
    public boolean onSaveData(IntentParams intentParams) {
        return false;
    }

    @Override
    public boolean onRestoreData(IntentParams intentParams) {
        return false;
    }

    @Override
    public void onCompleteContinuation(int i) {

    }
}
