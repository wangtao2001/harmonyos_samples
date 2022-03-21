package info.shuangchen.pageability;

import info.shuangchen.pageability.slice.FirstAbilityFirstSlice;
import info.shuangchen.pageability.slice.MainAbilitySlice;
import info.shuangchen.pageability.slice.SecondAbilityFirstSlice;
import info.shuangchen.pageability.slice.SecondAbilitySecondSlice;
import ohos.aafwk.ability.Ability;
import ohos.aafwk.content.Intent;

public class SecondAbility extends Ability {

    public static final String ACTION = "SECOND_ABILITY_SECOND_SLICE_ACTION";
    @Override
    public void onStart(Intent intent) {
        super.onStart(intent);
        super.setMainRoute(SecondAbilityFirstSlice.class.getName());
        super.addActionRoute(ACTION, SecondAbilitySecondSlice.class.getName());
    }
}
