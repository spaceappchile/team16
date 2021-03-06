//
// DO NOT EDIT THIS FILE, IT HAS BEEN GENERATED USING AndroidAnnotations.
//


package cl.ingennia.wishmaker.fragment;

import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import cl.ingennia.wishmaker.adapter.MeteorAdapter_;
import cl.ingennia.wishmaker.domain.Meteor;
import cl.ingennia.wishmaker.rest.RestClient_;
import com.googlecode.androidannotations.api.BackgroundExecutor;

public final class MeteorsFragment_
    extends MeteorsFragment
{

    private View contentView_;
    private Handler handler_ = new Handler();

    private void init_(Bundle savedInstanceState) {
        rest = new RestClient_();
        adapter = MeteorAdapter_.getInstance_(getActivity());
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        init_(savedInstanceState);
        super.onCreate(savedInstanceState);
    }

    private void afterSetContentView_() {
        ((MeteorAdapter_) adapter).afterSetContentView_();
        loadAdapter();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        contentView_ = super.onCreateView(inflater, container, savedInstanceState);
        afterSetContentView_();
        return contentView_;
    }

    public View findViewById(int id) {
        if (contentView_ == null) {
            return null;
        }
        return contentView_.findViewById(id);
    }

    public static MeteorsFragment_.FragmentBuilder_ builder() {
        return new MeteorsFragment_.FragmentBuilder_();
    }

    @Override
    public void startListAdapter(final Meteor[] meteors) {
        handler_.post(new Runnable() {


            @Override
            public void run() {
                try {
                    MeteorsFragment_.super.startListAdapter(meteors);
                } catch (RuntimeException e) {
                    Log.e("MeteorsFragment_", "A runtime exception was thrown while executing code in a runnable", e);
                }
            }

        }
        );
    }

    @Override
    public void loadAdapter() {
        BackgroundExecutor.execute(new Runnable() {


            @Override
            public void run() {
                try {
                    MeteorsFragment_.super.loadAdapter();
                } catch (RuntimeException e) {
                    Log.e("MeteorsFragment_", "A runtime exception was thrown while executing code in a runnable", e);
                }
            }

        }
        );
    }

    public static class FragmentBuilder_ {

        private Bundle args_;

        private FragmentBuilder_() {
            args_ = new Bundle();
        }

        public MeteorsFragment build() {
            MeteorsFragment_ fragment_ = new MeteorsFragment_();
            fragment_.setArguments(args_);
            return fragment_;
        }

    }

}
