package datamodel;

public class Graphics extends Content{
	
	
	public Graphics(String id, double x, double y, String type, double width, double height, String fill, String stroke,
			int strokeWidth, String strokeDashArray, double scaleX, double scaleY, int opacity, boolean visible,
			double angle, double right, double bottom, String easing, String easeAttr, int easeValue,
			String otherParameters,int groupOrder,String animation,int animOrder,int duration) {
		super(id, x, y,groupOrder,animation,animOrder,duration);
		this.type = type;
		this.width = width;
		this.height = height;
		this.fill = fill;
		this.stroke = stroke;
		this.strokeWidth = strokeWidth;
		this.strokeDashArray = strokeDashArray;
		this.scaleX = scaleX;
		this.scaleY = scaleY;
		this.opacity = opacity;
		this.visible = visible;
		this.angle = angle;
		this.right = right;
		this.bottom = bottom;
		this.easing = easing;
		this.easeAttr = easeAttr;
		this.easeValue = easeValue;
		this.otherParameters = otherParameters;
	}

	private String type;
	
	private double width;
	
	private double height;
	
	private String fill;
	
	private String stroke;
	
	private int strokeWidth;
	
	private String strokeDashArray;
	
	private double scaleX;
	
	private double scaleY;
	
	private int opacity;
	
	private boolean visible;
	
	private double angle;
	
	private double right;
	
	private double bottom;
	
	private String easing;
	
	private String easeAttr;
	
	private int easeValue;
	
	private String otherParameters;
		
	

	public String getType() {
		return type;
	}

	public double getWidth() {
		return width;
	}

	public double getHeight() {
		return height;
	}

	public String getFill() {
		return fill;
	}

	public String getStroke() {
		return stroke;
	}

	public int getStrokeWidth() {
		return strokeWidth;
	}

	public String getStrokeDashArray() {
		return strokeDashArray;
	}

	public double getScaleX() {
		return scaleX;
	}

	public double getScaleY() {
		return scaleY;
	}

	public int getOpacity() {
		return opacity;
	}

	public boolean isVisible() {
		return visible;
	}

	public double getAngle() {
		return angle;
	}

	public double getRight() {
		return right;
	}

	public double getBottom() {
		return bottom;
	}

	public String getEasing() {
		return easing;
	}

	public String getEaseAttr() {
		return easeAttr;
	}

	public int getEaseValue() {
		return easeValue;
	}

	public String getOtherParameters() {
		return otherParameters;
	}
}
