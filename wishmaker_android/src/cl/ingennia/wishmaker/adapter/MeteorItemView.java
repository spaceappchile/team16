package cl.ingennia.wishmaker.adapter;

import android.annotation.SuppressLint;
import android.content.Context;
import android.widget.LinearLayout;
import android.widget.TextView;
import cl.ingennia.wishmaker.R;
import cl.ingennia.wishmaker.domain.Meteor;

import com.googlecode.androidannotations.annotations.EViewGroup;
import com.googlecode.androidannotations.annotations.ViewById;

@EViewGroup(R.layout.item_meteorview)
public class MeteorItemView extends LinearLayout {

	@ViewById
	TextView title;

	public MeteorItemView(Context context) {
		super(context);

	}

	@SuppressLint("NewApi")
	public void bind(Meteor meteor) {
		title.setText(meteor.getTitle());
	}

}
