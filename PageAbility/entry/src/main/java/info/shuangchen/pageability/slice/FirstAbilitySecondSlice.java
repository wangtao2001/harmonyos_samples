package info.shuangchen.pageability.slice;

import info.shuangchen.pageability.ResourceTable;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.content.Intent;

public class FirstAbilitySecondSlice extends AbilitySlice {
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setUIContent(ResourceTable.Layout_ability_first_second_slice);
        initComponents();
        setResult();
    }

    private void initComponents() {
        findComponentById(ResourceTable.Id_button_back).setClickedListener(
                component -> terminate()
        );
    }

    private void setResult() {
        Intent intent= new Intent();
        setResult(intent);
    }

    @Override
    public void onActive() {
        super.onActive();
    }

    @Override
    public void onForeground(Intent intent) {
        super.onForeground(intent);
    }
}
