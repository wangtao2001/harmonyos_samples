package info.shuangchen.pageability.slice;

import info.shuangchen.pageability.ResourceTable;
import ohos.aafwk.ability.AbilitySlice;
import ohos.aafwk.ability.IAbilityContinuation;
import ohos.aafwk.content.Intent;
import ohos.aafwk.content.IntentParams;
import ohos.agp.components.Component;
import ohos.agp.components.TextField;
import ohos.agp.window.dialog.ToastDialog;

public class ContinuationAbilitySlice extends AbilitySlice implements IAbilityContinuation {
    private String message;

    private boolean isContinued;

    private TextField messageTextField;
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setUIContent(ResourceTable.Layout_ability_continuation);
        initComponents();
    }

    private void initComponents() {
        findComponentById(ResourceTable.Id_continue_button).setClickedListener(this::migrateAbility);
        messageTextField = (TextField) findComponentById(ResourceTable.Id_message_textField);
        if (isContinued && message != null) {
            messageTextField.setText(message);
        }
    }

    private void migrateAbility(Component component) {
        String messageSend = messageTextField.getText();
        if (messageSend.isEmpty()) {
            new ToastDialog(this).setText("没有信息输入").show();
            return;
        }
        try {
            continueAbility();
        } catch (IllegalStateException illegalStateException) {

        }
    }

    @Override
    public boolean onStartContinuation() {
        return true;
    }

    @Override
    public boolean onSaveData(IntentParams intentParams) {
        intentParams.setParam("INPUT_MESSAGE", messageTextField.getText());
        return true;
    }

    @Override
    public boolean onRestoreData(IntentParams intentParams) {
        if (intentParams.getParam("INPUT_MESSAGE") instanceof String) {
            message = (String) intentParams.getParam("INPUT_MESSAGE");
            isContinued = true;
        }
        return true;
    }

    @Override
    public void onCompleteContinuation(int code) {
        terminate();
    }
}
