package com.bean;

import java.sql.Date;

public class JioScoresCircle {
	private Date Date;
	private String Circle;
	private String CityName;
	private String JioCenter;
	private String Cluster;
	private Double CoveragePercent;
	private Double CapacityPercent;
	private Double QosPercent;
	private Double JCSPercent;
	private String ES;
	private Date PredictedDate;
	private Double PredictedJCSPercent;
	private String PredictedES;

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		this.Date = date;
	}

	public String getCircle() {
		return Circle;
	}

	public void setCircle(String circle) {
		this.Circle = circle;
	}

	public String getCityName() {
		return CityName;
	}

	public void setCityName(String cityName) {
		this.CityName = cityName;
	}

	public String getJioCenter() {
		return JioCenter;
	}

	public void setJioCenter(String jioCenter) {
		this.JioCenter = jioCenter;
	}

	public String getCluster() {
		return Cluster;
	}

	public void setCluster(String cluster) {
		this.Cluster = cluster;
	}

	public Double getCoveragePercent() {
		return CoveragePercent;
	}

	public void setCoveragePercent(Double coveragePercent) {
		this.CoveragePercent = coveragePercent;
	}

	public Double getCapacityPercent() {
		return CapacityPercent;
	}

	public void setCapacityPercent(Double capacityPercent) {
		this.CapacityPercent = capacityPercent;
	}

	public Double getQosPercent() {
		return QosPercent;
	}

	public void setQosPercent(Double qosPercent) {
		this.QosPercent = qosPercent;
	}

	public Double getJCSPercent() {
		return JCSPercent;
	}

	public void setJCSPercent(Double jCSPercent) {
		this.JCSPercent = jCSPercent;
	}

	public String getES() {
		return ES;
	}

	public void setES(String eS) {
		this.ES = eS;
	}

	public Date getPredictedDate() {
		return PredictedDate;
	}

	public void setPredictedDate(Date predictedDate) {
		this.PredictedDate = predictedDate;
	}

	public Double getPredictedJCSPercent() {
		return PredictedJCSPercent;
	}

	public void setPredictedJCSPercent(Double predictedJCSPercent) {
		this.PredictedJCSPercent = predictedJCSPercent;
	}

	public String getPredictedES() {
		return PredictedES;
	}

	public void setPredictedES(String predictedES) {
		this.PredictedES = predictedES;
	}

	public JioScoresCircle() {
	}

/*	public JioScoresCircle(Date date, String circle, String cityName, String cluster, Double coveragePercent,
			Double capacityPercent, Double qosPercent, Double jCSPercent, String eS, Date predictedDate,
			Double predictedJCSPercent, String predictedES) {
		super();
		this.Date = date;
		this.Circle = circle;
		this.CityName = cityName;
		this.Cluster = cluster;
		this.CoveragePercent = coveragePercent;
		this.CapacityPercent = capacityPercent;
		this.QosPercent = qosPercent;
		this.JCSPercent = jCSPercent;
		this.ES = eS;
		this.PredictedDate = predictedDate;
		this.PredictedJCSPercent = predictedJCSPercent;
		this.PredictedES = predictedES;
	}
*/
	
	public JioScoresCircle(String circle, String cityName, String cluster, String jioCenter, Double coveragePercent) {
		super();
		this.Circle = circle;
		this.CityName = cityName;
		this.Cluster = cluster;
		this.JioCenter = jioCenter;
		this.CoveragePercent = coveragePercent;
	}

	public JioScoresCircle(String circle, String cityName, String jioCenter, String cluster, Double coveragePercent,
			Double capacityPercent, Double qosPercent, Double jCSPercent, String eS) {
		super();
		//this.Date = date;
		this.Circle = circle;
		this.CityName = cityName;
		this.JioCenter = jioCenter;
		this.Cluster = cluster;
		this.CoveragePercent = coveragePercent;
		this.CapacityPercent = capacityPercent;
		this.QosPercent = qosPercent;
		this.JCSPercent = jCSPercent;
		this.ES = eS;
		/*this.PredictedDate = predictedDate;
		this.PredictedJCSPercent = predictedJCSPercent;
		this.PredictedES = predictedES;*/
	}

	public JioScoresCircle(String circle) {
		super();
		this.Circle = circle;
	}

	@Override
	public String toString() {
		return "JioScoresCircle [Date=" + Date + ", Circle=" + Circle + ", CityName=" + CityName + ", JioCenter="
				+ JioCenter + ", Cluster=" + Cluster + ", CoveragePercent=" + CoveragePercent + ", CapacityPercent="
				+ CapacityPercent + ", QosPercent=" + QosPercent + ", JCSPercent=" + JCSPercent + ", ES=" + ES
				+ ", PredictedDate=" + PredictedDate + ", PredictedJCSPercent=" + PredictedJCSPercent + ", PredictedES="
				+ PredictedES + "]";
	}
	
}

