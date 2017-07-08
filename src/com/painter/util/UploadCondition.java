package com.painter.util;

import java.io.File;

import org.apache.struts2.ServletActionContext;

/**
 * 用于文件上传
 * @author dDaidai
 *
 */
public class UploadCondition {
	private File upload ;
	private String uploadFileName;
	private String uploadContentType;
	private String savePath = "/upload";
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
    
}
