package crc6431345fe65afe8d98;


public class AvaloniaView
	extends android.widget.FrameLayout
	implements
		mono.android.IGCUserPeer
{

	public AvaloniaView (android.content.Context p0, android.util.AttributeSet p1, int p2)
	{
		super (p0, p1, p2);
		if (getClass () == AvaloniaView.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.AvaloniaView, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2 });
		}
	}

	public AvaloniaView (android.content.Context p0, android.util.AttributeSet p1)
	{
		super (p0, p1);
		if (getClass () == AvaloniaView.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.AvaloniaView, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}

	public AvaloniaView (android.content.Context p0)
	{
		super (p0);
		if (getClass () == AvaloniaView.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.AvaloniaView, Avalonia.Android", "Android.Content.Context, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}

	public boolean dispatchKeyEvent (android.view.KeyEvent p0)
	{
		return n_dispatchKeyEvent (p0);
	}

	private native boolean n_dispatchKeyEvent (android.view.KeyEvent p0);

	public void onVisibilityAggregated (boolean p0)
	{
		n_onVisibilityAggregated (p0);
	}

	private native void n_onVisibilityAggregated (boolean p0);

	public void onVisibilityChanged (android.view.View p0, int p1)
	{
		n_onVisibilityChanged (p0, p1);
	}

	private native void n_onVisibilityChanged (android.view.View p0, int p1);

	public void onConfigurationChanged (android.content.res.Configuration p0)
	{
		n_onConfigurationChanged (p0);
	}

	private native void n_onConfigurationChanged (android.content.res.Configuration p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
