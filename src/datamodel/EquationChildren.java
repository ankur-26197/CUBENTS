package datamodel;

public class EquationChildren {
	
	
	String classId;
	
	String fontStyle;
	
	String fontWeight;
	
	String fontFamily;
	
	String color;
	
	public EquationChildren(String classId, String fontStyle, String fontWeight, String fontFamily, String color) {
		super();
		this.classId = classId;
		this.fontStyle = fontStyle;
		this.fontWeight = fontWeight;
		this.fontFamily = fontFamily;
		this.color = color;
	}

	public String getClassId() {
		return classId;
	}

	public String getFontStyle() {
		return fontStyle;
	}

	public String getFontWeight() {
		return fontWeight;
	}

	public String getFontFamily() {
		return fontFamily;
	}

	public String getColor() {
		return color;
	}

	
	
}
