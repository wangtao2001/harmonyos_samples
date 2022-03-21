package info.shuangchen.pageability.slice;

import info.shuangchen.pageability.ResourceTable;
import info.shuangchen.pageability.SecondAbility;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.content.Intent;
import ohos.aafwk.content.Operation;
import ohos.agp.components.Component;

import static info.shuangchen.pageability.SecondAbility.ACTION;

public class FirstAbilityFirstSlice extends AbilitySlice {
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setUIContent(ResourceTable.Layout_ability_first_first_slice);
        initComponents();
    }

    private void initComponents() {
        findComponentById(ResourceTable.Id_button_back).setClickedListener(
                component -> terminate()
        );
        findComponentById(ResourceTable.Id_button_next_slice).setClickedListener(
                component -> presentForResult(new FirstAbilitySecondSlice(), new Intent(), 0)
        );
        findComponentById(ResourceTable.Id_button_next_ability).setClickedListener(
                this::startNextAbility
        );
        findComponentById(ResourceTable.Id_button_next_slice2).setClickedListener(
                this::startNextAbilitySlice2
        );
    }

    private void startNextAbility(Component component) {
        Intent intent = new Intent();
        Operation operation = new Intent.OperationBuilder().withDeviceId("")
                .withBundleName(getBundleName())
                .withAbilityName(SecondAbility.class.getName())
                .build();
        intent.setOperation(operation);
        startAbility(intent);
    }

    private void startNextAbilitySlice2(Component component){
        Intent intent = new Intent();
        Operation operation = new Intent.OperationBuilder().withDeviceId("")
                .withAction(ACTION)
                .withBundleName(getBundleName())
                .withAbilityName(SecondAbility.class.getName())
                .build();
        intent.setOperation(operation);
        startAbility(intent);
    }

    @Override
    protected void onResult(int requestCode, Intent resultIntent) {

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
