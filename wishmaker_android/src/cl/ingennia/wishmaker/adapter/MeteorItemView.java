package cl.ingennia.wishmaker.adapter;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.widget.LinearLayout;
import android.widget.TextView;
import cl.ingennia.wishmaker.R;
import cl.ingennia.wishmaker.domain.Meteor;

import com.googlecode.androidannotations.annotations.EViewGroup;
import com.googlecode.androidannotations.annotations.ViewById;
import com.googlecode.androidannotations.annotations.res.DrawableRes;

@EViewGroup(R.layout.item_meteor)
public class MeteorItemView extends LinearLayout {

	public int[] drawables = { R.drawable.small1, R.drawable.small2,
			R.drawable.small3, R.drawable.small4, R.drawable.small5,
			R.drawable.small6 };

	@ViewById
	TextView title;

	@DrawableRes
	Drawable small1;

	public MeteorItemView(Context context) {
		super(context);

	}

	public void bind(Meteor meteor) {
		int value = (int) (meteor.getId() % 6);
		setBackgroundResource(drawables[value]);
		title.setText(meteor.getTitle());
	}

}
