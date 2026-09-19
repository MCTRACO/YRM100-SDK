package crc64bd239b21961e24ab;


public class TopLevelImpl_ViewImpl
	extends crc6431345fe65afe8d98.InvalidationAwareSurfaceView
	implements
		mono.android.IGCUserPeer,
		android.view.SurfaceHolder.Callback
{

	public TopLevelImpl_ViewImpl (android.content.Context p0, android.util.AttributeSet p1, int p2)
	{
		super (p0, p1, p2);
		if (getClass () == TopLevelImpl_ViewImpl.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+ViewImpl, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2 });
		}
	}

	public TopLevelImpl_ViewImpl (android.content.Context p0, android.util.AttributeSet p1)
	{
		super (p0, p1);
		if (getClass () == TopLevelImpl_ViewImpl.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+ViewImpl, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}

	public TopLevelImpl_ViewImpl (android.content.Context p0)
	{
		super (p0);
		if (getClass () == TopLevelImpl_ViewImpl.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+ViewImpl, Avalonia.Android", "Android.Content.Context, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}

	public void dispatchDraw (android.graphics.Canvas p0)
	{
		n_dispatchDraw (p0);
	}

	private native void n_dispatchDraw (android.graphics.Canvas p0);

	public boolean dispatchGenericPointerEvent (android.view.MotionEvent p0)
	{
		return n_dispatchGenericPointerEvent (p0);
	}

	private native boolean n_dispatchGenericPointerEvent (android.view.MotionEvent p0);

	public boolean dispatchTouchEvent (android.view.MotionEvent p0)
	{
		return n_dispatchTouchEvent (p0);
	}

	private native boolean n_dispatchTouchEvent (android.view.MotionEvent p0);

	public boolean dispatchKeyEvent (android.view.KeyEvent p0)
	{
		return n_dispatchKeyEvent (p0);
	}

	private native boolean n_dispatchKeyEvent (android.view.KeyEvent p0);

	public boolean onCheckIsTextEditor ()
	{
		return n_onCheckIsTextEditor ();
	}

	private native boolean n_onCheckIsTextEditor ();

	public android.view.inputmethod.InputConnection onCreateInputConnection (android.view.inputmethod.EditorInfo p0)
	{
		return n_onCreateInputConnection (p0);
	}

	private native android.view.inputmethod.InputConnection n_onCreateInputConnection (android.view.inputmethod.EditorInfo p0);

	public void surfaceChanged (android.view.SurfaceHolder p0, int p1, int p2, int p3)
	{
		n_surfaceChanged (p0, p1, p2, p3);
	}

	private native void n_surfaceChanged (android.view.SurfaceHolder p0, int p1, int p2, int p3);

	public void surfaceCreated (android.view.SurfaceHolder p0)
	{
		n_surfaceCreated (p0);
	}

	private native void n_surfaceCreated (android.view.SurfaceHolder p0);

	public void surfaceDestroyed (android.view.SurfaceHolder p0)
	{
		n_surfaceDestroyed (p0);
	}

	private native void n_surfaceDestroyed (android.view.SurfaceHolder p0);

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
