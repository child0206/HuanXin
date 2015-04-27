package com.doext.module.test;

import java.util.HashMap;
import java.util.Map;

import android.os.Bundle;

import com.doext.module.frame.debug.DoService;

import core.DoServiceContainer;
import doext.implement.M0005_HuanXinIM_Model;

public class DoTestEasemobActivity extends DoTestActivity{

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
	}
	
	@Override
	protected void initModuleModel() throws Exception {
		this.model = new M0005_HuanXinIM_Model();
	}

	@Override
	protected void doTestSyncMethod() {
		/*Map<String, String>  _paras_chat = new HashMap<String, String>();
		_paras_chat.put("username", "heping");
		DoService.syncMethod(this.model, "enterChat", _paras_chat);*/
	}

	@Override
	protected void doTestAsyncMethod() {
		Map<String, String>  _paras_login = new HashMap<String, String>();
		_paras_login.put("username", "zzy");
		_paras_login.put("password", "123456");
		DoService.ansyncMethod(this.model, "login", _paras_login, new DoService.EventCallBack() {
			
			@Override
			public void eventCallBack(String _data) {
				DoServiceContainer.getLogEngine().writeDebug("IMLogin：" + _data);
				Map<String, String>  _paras_chat = new HashMap<String, String>();
				_paras_chat.put("username", "heping");
				DoService.syncMethod(model, "enterChat", _paras_chat);
				
			}
		});
	}
	
	
}
