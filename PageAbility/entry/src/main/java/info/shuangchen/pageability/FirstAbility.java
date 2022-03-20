package info.shuangchen.pageability;

import info.shuangchen.pageability.slice.FirstAbilityFirstSlice;
import info.shuangchen.pageability.slice.MainAbilitySlice;
import ohos.aafwk.ability.Ability;
import ohos.aafwk.content.Intent;

public class FirstAbility extends Ability {
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setMainRoute(FirstAbilityFirstSlice.class.getName());
    }
}
