package com.chtrembl.petstoreapp.service;

import com.microsoft.applicationinsights.telemetry.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.Map;

/**
 * Stub for overriding during Unit Testing. (Should really live in Test package)
 */
public class TelemetryClient extends com.microsoft.applicationinsights.TelemetryClient {
	private static final String message = "azure.application-insights.instrumentation-key not found, considering configuring Application Inisghts if you would like to track Telemtry.";
	private static final Logger logger = LoggerFactory.getLogger(TelemetryClient.class);

	@Override
	public void track(Telemetry telemetry) {
		String timestamp = telemetry.getTimestamp() != null ? telemetry.getTimestamp().toString() : null;
		logger.warn("TelemetryClient: %s telemetry: %s%n", timestamp, telemetry.getClass());

		if (!telemetry.getProperties().isEmpty()) {
			telemetry.getProperties().forEach((key, value) -> logger.warn("TelemetryClient Properties: \t%s: %s%n", key, value));
		}
	}

	@Override
	public void trackDependency(RemoteDependencyTelemetry telemetry) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackDependency(String dependencyName, String commandName, Duration duration, boolean success) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackEvent(EventTelemetry telemetry) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackEvent(String name, Map<String, String> properties, Map<String, Double> metrics) {
		logger.warn("TelemetryClient: %l telemetry: %s%n", System.currentTimeMillis(), name);

		if (!properties.isEmpty()) {
			properties.forEach((key, value) -> logger.warn("TelemetryClient Properties: \t%s: %s%n", key, value));
		}
		if (!metrics.isEmpty()) {
			metrics.forEach((key, value) -> logger.warn("TelemetryClient Metrics: \t%s: %s%n", key, value));
		}
	}

	@Override
	public void trackEvent(String name) {
		logger.warn("TelemetryClient: %l telemetry: %s%n", System.currentTimeMillis(), name);
	}

	@Override
	public void trackException(Exception exception, Map<String, String> properties, Map<String, Double> metrics) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackException(Exception exception) {
		logger.error("TelemetryClient: %s (%s): %s%n", System.currentTimeMillis(), exception.getMessage(), exception.getCause());
	}

	@Override
	public void trackException(ExceptionTelemetry telemetry) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackHttpRequest(String name, Date timestamp, long duration, String responseCode, boolean success) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackMetric(MetricTelemetry telemetry) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackMetric(String name, double value, int sampleCount, double min, double max,
							Map<String, String> properties) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackMetric(String name, double value, Integer sampleCount, Double min, Double max, Double stdDev,
							Map<String, String> properties) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackMetric(String name, double value) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackPageView(PageViewTelemetry telemetry) {
		logger.error("TelemetryClient: %s: %s%n", System.currentTimeMillis(), telemetry.getUri());
		if (!telemetry.getProperties().isEmpty()) {
			telemetry.getProperties().forEach((key, value) -> logger.warn("TelemetryClient Properties: \t%s: %s%n", key, value));
		}
		if (!telemetry.getMetrics().isEmpty()) {
			telemetry.getMetrics().forEach((key, value) -> logger.warn("TelemetryClient Metrics: \t%s: %s%n", key, value));
		}
	}

	@Override
	public void trackPageView(String name) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackRequest(RequestTelemetry request) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackSessionState(SessionState sessionState) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackTrace(String message, SeverityLevel severityLevel, Map<String, String> properties) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackTrace(String message, SeverityLevel severityLevel) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackTrace(String message) {
		logger.warn("TelemetryClient: " + message);
	}

	@Override
	public void trackTrace(TraceTelemetry telemetry) {
		logger.warn("TelemetryClient: " + message);
	}
}
