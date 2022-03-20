package info.shuangchen.pageability.slice;

    import info.shuangchen.pageability.FirstAbility;
    import info.shuangchen.pageability.ResourceTable;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.content.Intent;
    import ohos.aafwk.content.Operation;
    import ohos.agp.components.Component;

public class MainAbilitySlice extends AbilitySlice {
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setUIContent(ResourceTable.Layout_ability_main);
        initComponents();
    }

    private void initComponents() {
        findComponentById(ResourceTable.Id_button_first_ability).setClickedListener(this::startFirstAbility);
    }


    private void startFirstAbility(Component component) {
        Intent intent = new Intent();
        Operation operation = new Intent.OperationBuilder().withDeviceId("")
                .withBundleName(getBundleName())
                .withAbilityName(FirstAbility.class.getName())
                .build();
        intent.setOperation(operation);
        startAbility(intent);

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
